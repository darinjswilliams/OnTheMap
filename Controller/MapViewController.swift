//
//  MapViewController.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/22/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
//    var mapAnnotations = [MKAnnotation]()
     var annotations = [MKAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getStudentLocations()
          mapView.delegate = self

        // Do any additional setup after loading the view.
    }
 
    @IBAction func logOutButton(_ sender: Any) {
        
        OnTheMapRestClient.logout {
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }

    @IBAction func addPinLocation(_ sender: Any) {
        let findPinLocationController =  self.storyboard?.instantiateViewController(withIdentifier: "findPinLocation") as! UIViewController
        self.present(findPinLocationController, animated: true, completion: nil)
        
    }
    
    func getStudentLocations() {
        // get Session id
//        requestGetStudents(url: EndPoints.getStudentLimit.url) { (response, error) in
    
//        print("getStudentLocation: Here is session id \(uniqueKey)")
        OnTheMapRestClient.getSessionId(userID: AuthenticateStore.userKey, completionHandler: handleStudentSession(studentLocations:error:))
        
            ParseClient.getStudentList(completion: handleStudentResponse(studentLocations:error:))
    
    }
    

    
    func handleStudentSession(studentLocations:UserProfile?, error:Error?){
   
        
        guard let studentLocations = studentLocations else {
            showMapFailure(message: "Session Error:\(error)")
            return
        }
        
    }
    
    func handleStudentResponse(studentLocations:[StudentLocations]?, error:Error?) {
    
        //check pre condtions
        guard let studentLocations = studentLocations else {
            showMapFailure(message: "Error Parsing Student:\(error)")
            return
        }
        updateMapWithStudentLocations(studentLocations:studentLocations)
    }
    
    
    
    func updateMapWithStudentLocations(studentLocations:[StudentLocations]){
        
           print("udpateMapwithStudents\(studentLocations.count)")
//           self.mapView.removeAnnotations(mapView.annotations)

            for student in studentLocations {
                print("Inside for loop with studnet \(student)")
                let lat = CLLocationDegrees(student.latitude ?? 0)
                let long = CLLocationDegrees(student.longitude ?? 0)
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = student.studenFullName
                annotation.subtitle = student.studentUrl
                
                annotations.append(annotation)
            }
   
            self.mapView.addAnnotations(annotations)
            
        }
    
    // each pin's rendering
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationId)
            pinView?.canShowCallout = true
            pinView?.pinTintColor = .red
            pinView?.rightCalloutAccessoryView = UIButton(type:.detailDisclosure)
        } else {
            pinView?.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if (control == view.rightCalloutAccessoryView) {
            let app = UIApplication.shared
            if let url = view.annotation?.subtitle! {
                guard !url.isEmpty else {
                     print("NOT VALID URL")
                    return
                }
                app.open(URL(string: url)!, options: [:], completionHandler: nil)
            }
        }
    }
    
    func showMapFailure(message: String) {
        let alertVC = UIAlertController(title: "Map Error", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        show(alertVC, sender: nil)
    }
    
    
}
