//
//  StudentInformation.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/20/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation

struct SearchResults: Codable {
    let results: [StudentLocations]
}

struct StudentLocations: Codable {
    let objectId:  String?
    let uniqueKey: String?
    let firstName: String?
    let lastName:  String?
    let mapString: String?
    let mediaURL:  String?
    let latitude:  Double?
    let longitude: Double?
    
 
    var studenFullName: String {
        
        var studentName: String
        
        guard let fname = firstName, !fname.isEmpty,
              let  lname = lastName, !lname.isEmpty else {
            return  "No first name Or last Name"
        }
        
        studentName = fname + lname
        
        return studentName
        
    }
    
    
    
    var studentUrl: String {
        
        //Validate against nil and empty
        guard let  mUrl = mediaURL, !mUrl.isEmpty else {
            return ""
        }
        
        return mUrl
    }
}

struct SingleStudent: Codable {
    let result: StudentLocations
}


struct StudentInfo: Codable {
    let nickname: String
}
