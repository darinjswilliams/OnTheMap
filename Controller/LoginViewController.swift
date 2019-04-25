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
    
    
    @IBAction func loginButton(_ sender: Any) {
        //authenticate user against Udacity's Servers

        guard let emailAddr = self.emailTextField.text, !emailAddr.isEmpty else {
            showLoginFailure(message: "Email Required")
            return
        }
        
        guard let passWord = self.passWordTextField.text, !passWord.isEmpty else {
            showLoginFailure(message: "Password Required")
            return
        }
        
        OnTheMapRestClient.login(username: self.emailTextField.text ?? "", password: self.passWordTextField.text ?? "", completionHandler: self.handleLoginResponse(success:error:))
        
    }
    
    
    @IBAction func addPinLocation(_ sender: Any) {
        let pinController =  self.storyboard?.instantiateViewController(withIdentifier: "findPinLocation") as! UITabBarController
        self.present(pinController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
      //Send to sign up page if not a valid udacity user
     UIApplication.shared.open(EndPoints.signIn.url)
        
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
        OnTheMapRestClient.logout {
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    func handleLoginResponse(success: Bool, error: Error?) {
      
        if success {
     
             let uniqueKey = SessionModel.session?.account.key
            print("HandleLoginResponse..\(uniqueKey)")
            
            let mainController =  self.storyboard?.instantiateViewController(withIdentifier: "HomeTabBarController") as! UITabBarController
            self.present(mainController, animated: true, completion: nil)
            
//            OnTheMapRestClient.getSessionId(userID: uniqueKey!, completionHandler: handleSessionResponse(success:error:))
        } else {
            showLoginFailure(message: error?.localizedDescription ?? "")
        }
        
    }
    
    func handleSessionResponse(success: Bool, error: Error?) {
        if success {
            print ("Successful Login")
//            sucessfulLogin()
        } else {
            showLoginFailure(message: error?.localizedDescription ?? "")
        }
    }
    
    func showLoginFailure(message: String) {
        let alertVC = UIAlertController(title: "Login Failed", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        show(alertVC, sender: nil)
    }
    
    
}
