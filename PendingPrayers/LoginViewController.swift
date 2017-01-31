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
        

        if txtEmail.text == ""{
            AlertDisplayWith("Pending Prayer", body: "Email required", vc: self)
        }
        else if txtPassword.text == ""{
            AlertDisplayWith("Pending Prayer", body: "Password required", vc: self)
        }
        else{

        let webObj = WebserviceHelper()
        webObj.loginUser(["email":txtEmail.text!,"password":txtPassword.text!], comletionHandler: {(userInfo:[String:String]?,errorMessage:String)->Void in
            //{"userId":"13","name":"mohan singh ","lastname":"thagunna","email":"mohan1234@outlook.com","days":"2","prayitem":"m-m-m"}
            if (userInfo != nil ){
                UserDefaults.standard.set(userInfo?["userId"], forKey: "userId")
                UserDefaults.standard.set(userInfo?["name"], forKey: "name")
                UserDefaults.standard.set(userInfo?["lastname"], forKey: "lastname")
                UserDefaults.standard.set(userInfo?["email"], forKey: "email")
                UserDefaults.standard.set(userInfo?["days"], forKey: "days")
                if userInfo?["prayitem"] != ""{
                UserDefaults.standard.set(userInfo?["prayitem"], forKey: "prayitem")
                }
                UserDefaults.standard.synchronize()
                let vc  = self.storyboard?.instantiateViewController(withIdentifier: "homeNav") as! UINavigationController
                self.present(vc, animated: true, completion: nil)
              
            }
            else{
                //error
                AlertDisplayWith("Pending Prayer", body: "Credential not match please try again", vc: self)
            }
        })
        }
    }
    
    @IBAction func btnSignUPTapped(_ sender: Any) {
        let regestrationview  = storyboard?.instantiateViewController(withIdentifier: "registrationview") as! RegistrationViewController;
        self.present(regestrationview, animated: true, completion: nil)

    }
}
