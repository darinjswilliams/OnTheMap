//
//  PostViewController.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/22/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import UIKit
import MapKit

class PostViewController: ViewController {

    @IBOutlet weak var findAddressLocation: UITextField!
    
    @IBOutlet weak var addressLink: UITextField!
    
    @IBOutlet weak var addLocationMap: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        let mainController =  self.storyboard?.instantiateViewController(withIdentifier: "HomeTabBarController") as! UITabBarController
        self.present(mainController, animated: true, completion: nil)
    }
    
    @IBAction func findLocationButton(_ sender: Any) {
        //TODO PASS FINDADDRESSLOCATION
        
    }
    /*
     @IBAction func cancelFindLocation(_ sender: Any) {
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
