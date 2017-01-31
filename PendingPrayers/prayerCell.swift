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
        //        UserDefaults.standard.set(userInfo?["userId"], forKey: "userId")
        //        UserDefaults.standard.set(userInfo?["name"], forKey: "name")
        //        UserDefaults.standard.set(userInfo?["lastname"], forKey: "lastname")
        //        UserDefaults.standard.set(userInfo?["email"], forKey: "email")
        //        UserDefaults.standard.set(userInfo?["days"], forKey: "days")
        //        UserDefaults.standard.set(userInfo?["prayitem"], forKey: "prayitem")
        //        UserDefaults.standard.synchronize()
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
            webObj.loginUser(["userid":userId!,"prayname":rowValue!], comletionHandler: {(userInfo:[String:String]?,errorMessage:String)->Void in
                //{"userId":"13","name":"mohan singh ","lastname":"thagunna","email":"mohan1234@outlook.com","days":"2","prayitem":"m-m-m"}
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
