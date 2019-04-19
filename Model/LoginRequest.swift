//
//  LoginRequest.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/18/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation

struct LoginRequest: Codable {
    let username: String
    let password: String
    let authorizationToken: String 
}
