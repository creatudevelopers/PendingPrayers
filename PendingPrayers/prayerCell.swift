//
//  prayerCell.swift
//  PendingPrayers
//
//  Created by Mohan on 1/23/17.
//  Copyright © 2017 EBPearls. All rights reserved.
//

import UIKit

protocol prayerCellDelegates {
    func selectedRowLimit(index:Int)
}
class prayerCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    var delegate:prayerCellDelegates?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(title:String,tag:Int,isDone:Bool){
        lblTitle.text = title
        btnDone.tag = tag
        if isDone{
            btnDone.backgroundColor = .clear
        }
        else{
             btnDone.backgroundColor = UIColor(red:0.14, green:0.64, blue:0.92, alpha:1.0)
        }
    }
    
    @IBAction func doneBtnTapped(_ sender: Any) {
        let btnDone = sender as! UIButton
        if btnDone.backgroundColor != .clear{
        btnDone.backgroundColor = .clear
            let tagInt = btnDone.tag
          
          var rowValue =  UserDefaults.standard.value(forKey: "selectedRow") as? String
            if rowValue == nil{
                rowValue = "\(tagInt)"
            }
            else{
                rowValue = "\(rowValue!),\(tagInt)"
            }
            UserDefaults.standard.set(rowValue, forKey: "selectedRow")
            UserDefaults.standard.synchronize()
            delegate?.selectedRowLimit(index: tagInt)
        }
    }
}
