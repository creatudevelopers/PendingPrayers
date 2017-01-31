//
//  RegistrationViewController.swift
//  PendingPrayers
//
//  Created by Mohan on 1/30/17.
//  Copyright © 2017 EBPearls. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtConfirmPass: UITextField!
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCloseTapped(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
 
   
    @IBAction func btnSignupTapped(_ sender: Any) {
    }
}
