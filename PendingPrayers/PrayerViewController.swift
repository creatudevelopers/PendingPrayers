//
//  PrayerViewController.swift
//  PendingPrayers
//
//  Created by Mohan on 1/23/17.
//  Copyright © 2017 EBPearls. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class PrayerViewController:  UIViewController,IndicatorInfoProvider {
    
    @IBOutlet weak var tableView: UITableView!
    var itemInfo: IndicatorInfo = "View"
    var prayerListData = [["title":"Fajr","isDone":false],["title":"Zuhar","isDone":false],["title":"Asr","isDone":false],["title":"Magrib","isDone":false],["title":"Isha","isDone":false],["title":"Witr","isDone":false]]
    var prayerList = [[String:Any]]();
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.register(UINib(nibName: "prayerCell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         prayerList = prayerListData
        if let rowValue =  UserDefaults.standard.value(forKey: "selectedRow"){
            let arrayString = (rowValue as! String).components(separatedBy: ",")
            for index in arrayString{
                let indexValue = Int(index)
                prayerList[indexValue!]["isDone"] = true
            }
        }
        else{
           
        }
        tableView.reloadData()
        
    }
    
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}

extension PrayerViewController:UITableViewDataSource,UITableViewDelegate,prayerCellDelegates{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = .clear
      return prayerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! prayerCell
        let isDone:Bool = prayerList[indexPath.row]["isDone"] as! Bool
        cell.configureCell(title: prayerList[indexPath.row]["title"] as! String, tag: indexPath.row, isDone:isDone)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }
    
    func selectedRowLimit(index:Int) {
        if let rowValue =  UserDefaults.standard.value(forKey: "selectedRow"){
            let arrayString = (rowValue as! String).components(separatedBy: ",")
            if arrayString.count >= prayerList.count{
                var totalDays = 0
                let daysCount =  UserDefaults.standard.value(forKey: "totalDays") as? String
                if daysCount == nil{
                    totalDays = 1
                }
                else{
                    totalDays = Int(daysCount!)! + 1
                }
                UserDefaults.standard.set("\(totalDays)", forKey: "totalDays")
             
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    // do stuff 42 seconds later
                
                UserDefaults.standard.removeObject(forKey: "selectedRow")
                 self.prayerList = self.prayerListData
                self.tableView.reloadData()
                }
                UserDefaults.standard.synchronize()
            }
        }

    }
}
