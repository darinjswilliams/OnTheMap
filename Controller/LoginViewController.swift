//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/15/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.text = ""
        passWordTextField.text = ""
        
    }
    
   //Seque to Main page after sucessful login
    private func sucessfulLogin() {
        
        let mainController =  self.storyboard?.instantiateViewController(withIdentifier: "HomeTabBarController") as! UITabBarController
        self.present(mainController, animated: true, completion: nil)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        //authenticate user against Udacity's Servers
        OnTheMapRestClient.loginClient(username: self.emailTextField.text ?? "", password: self.passWordTextField.text ?? "", completionHandler: self.handleLoginResponse(success:error:))
        
        //unsuccesful login siginal unsucessful login
        
        
        
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
      //Send to sign up page if not a valid udacity user
        
    }
    
    func handleLoginResponse(success: Bool, error: Error?) {
        if success {
            print ("Successful Login")
            sucessfulLogin()
        }
        
    }
    
    
}
