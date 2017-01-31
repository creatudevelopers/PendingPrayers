//
//  ChangePasswordViewController.swift
//  PendingPrayers
//
//  Created by Mohan Singh Thagunna on 1/30/17.
//  Copyright © 2017 EBPearls. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var txtOldPass: UITextField!
    @IBOutlet weak var txtNewPass: UITextField!

    @IBOutlet weak var txtNewPassAgain: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnChangeTapped(_ sender: Any) {
    }


}
