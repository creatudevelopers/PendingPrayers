//
//  PendingPrayerHomeViewController.swift
//  PendingPrayers
//
//  Created by Mohan on 1/23/17.
//  Copyright © 2017 EBPearls. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class PendingPrayerHomeViewController: ButtonBarPagerTabStripViewController {

    
    let blueInstagramColor = UIColor(red: 37/255.0, green: 111/255.0, blue: 206/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = UIColor(red:0.14, green:0.64, blue:0.92, alpha:1.0)
        settings.style.buttonBarItemBackgroundColor = UIColor(red:0.14, green:0.64, blue:0.92, alpha:1.0)
        settings.style.selectedBarBackgroundColor = .white
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = .white
        }
        super.viewDidLoad()
        // signUpForNotifications()
    }
    @IBAction func btnProfileTapped(_ sender: Any) {
        let pVc = storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! ProfileViewController
       let _ = self.navigationController?.pushViewController(pVc, animated: true)
    }
    @IBAction func btnLogoutTapped(_ sender: Any) {
    }
    
    // MARK: - PagerTabStripDataSource
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = PrayerViewController                                                                            ( itemInfo: "Pending Prayer")
        let child_2 = DuraionViewController(itemInfo: "Duration")
        let child_3 = MethodViewController(itemInfo: "Method")
        return [child_1, child_2, child_3]
    }
    
}
public func AlertDisplayWith(_ title:String?,body:String?,vc:UIViewController){
    let alert = UIAlertController(title: title, message: body, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
    vc.present(alert, animated: true, completion: nil)
}
