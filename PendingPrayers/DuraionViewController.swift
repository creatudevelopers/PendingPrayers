//
//  DuraionViewController.swift
//  PendingPrayers
//
//  Created by Mohan on 1/23/17.
//  Copyright © 2017 EBPearls. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class DuraionViewController:  UIViewController,IndicatorInfoProvider {
    
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblWeek: UILabel!
    @IBOutlet weak var lblDays: UILabel!
    var itemInfo: IndicatorInfo = "View"
   
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {

        if let daysCount =  UserDefaults.standard.value(forKey: "days") as? String{
           let tDays = Int(daysCount)!
            lblDays.text = "\(tDays % 7)"
            if tDays >= 7{
            lblWeek.text = "\((tDays / 7) % 52)"
            }
            if tDays >= 7*52{
            lblYear.text = "\(((tDays / 7) / 52))"
            }
        }
    }
    
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }}
