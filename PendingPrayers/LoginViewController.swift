//
//  LoginViewController.swift
//  PendingPrayers
//
//  Created by Mohan Singh Thagunna on 1/29/17.
//  Copyright © 2017 EBPearls. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnForgetPasswordTapped(_ sender: Any) {
        let forgetpasswordview  = storyboard?.instantiateViewController(withIdentifier: "ForgetPasswordView") as! ForgetPasswordViewController
        self.present(forgetpasswordview, animated: true, completion: nil)
    }

    @IBAction func btnLoginTapped(_ sender: Any) {
        let forgetpasswordview  = storyboard?.instantiateViewController(withIdentifier: "ForgetPasswordView") as! ForgetPasswordViewController
        self.present(forgetpasswordview, animated: true, completion: nil)

        let webObj = WebserviceHelper()
        webObj.loginUser(["":"" as AnyObject], comletionHandler: {(userInfo:[String:String]?,errorMessage:String)->Void in
           
            if (userInfo != nil ){
                UserDefaults.standard.set(0, forKey: "gb_login")
           
              
            }
            else{
                //error
            }
        })

    }
    
    @IBAction func btnSignUPTapped(_ sender: Any) {
        let regestrationview  = storyboard?.instantiateViewController(withIdentifier: "registrationview") as! RegistrationViewController;
        self.present(regestrationview, animated: true, completion: nil)

    }
}
