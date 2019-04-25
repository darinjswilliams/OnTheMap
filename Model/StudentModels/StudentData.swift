//
//  StudentData.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/21/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation

struct StudentData: Codable {
    let key: String
    let firstName: String
    let lastName: String
    let studentUrl: String
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
        case firstName = "first_name"
        case lastName = "last_name"
        case studentUrl = "_image_url"
    }
}
