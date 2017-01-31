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
        if txtFirstName.text == ""{
             AlertDisplayWith("Pending Prayer", body: "First Name required", vc: self)
        }
        else if txtFirstName.text == ""{
             AlertDisplayWith("Pending Prayer", body: "Last Name required", vc: self)
        }
        else if txtEmail.text == ""{
            AlertDisplayWith("Pending Prayer", body: "Email required", vc: self)
        }
        else if txtPass.text == ""{
            AlertDisplayWith("Pending Prayer", body: "Password required", vc: self)
        }
        else if txtPass.text != txtConfirmPass.text{
            AlertDisplayWith("Pending Prayer", body: "Password not same", vc: self)
        }
            
        else{
            
            let webObj = WebserviceHelper()
            webObj.signup(["email":txtEmail.text!,"password":txtPass.text!,"lastName":txtFirstName.text!,"name":txtFirstName.text!], comletionHandler: {(userInfo:[String:String]?,errorMessage:String)->Void in
                
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
                    AlertDisplayWith("Pending Prayer", body: "Signup Failed", vc: self)
                }
            })
        }
    }
}
