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
}

struct SingleStudent: Codable {
    let results: StudentLocations
}
