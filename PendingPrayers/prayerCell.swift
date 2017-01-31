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
        SetAnimation.forDataFetching.startAnimation()
        let btnDone = sender as! UIButton
        if btnDone.backgroundColor != .clear{
        btnDone.backgroundColor = .clear
            let tagInt = btnDone.tag
          let userId = UserDefaults.standard.value(forKey: "userId") as? String
          var rowValue =  UserDefaults.standard.value(forKey: "prayitem") as? String
            if rowValue == nil{
                rowValue = "\(tagInt)"
            }
            else{
                rowValue = "\(rowValue!),\(tagInt)"
            }
            
            let webObj = WebserviceHelper()
            webObj.prayUser(["userid":userId!,"prayname":rowValue!], comletionHandler: {(userInfo:[String:String]?,errorMessage:String)->Void in
               SetAnimation.forDataFetching.stopAnimation()
                if (userInfo != nil ){
                    
                    UserDefaults.standard.set(rowValue, forKey: "prayitem")
                    UserDefaults.standard.synchronize()
                    self.delegate?.selectedRowLimit(index: tagInt)
                    
                }
                else{
                    //error
                  //  AlertDisplayWith("Pending Prayer", body: "Not Saved ! Please try again", vc: self)
                }
            })

        }
    }
}
