//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/15/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

   //Seque to Main page after sucessful login
    private func sucessfulLogin() {
        
        let mainController =  self.storyboard?.instantiateViewController(withIdentifier: "HomeTabBarController") as! UINavigationController
        self.present(mainController, animated: true, completion: nil)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        //authenticate user against Udacity's Servers
        
        //unsuccesful login siginal unsucessful login
        
        
        
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
      //Send to sign up page if not a valid udacity user
        
    }
    
    
}
