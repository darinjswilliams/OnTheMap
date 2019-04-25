//
//  AuthenticateStore.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/16/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation

//Contains only Static data

struct AuthenticateStore {
    static let loginUrl = "https://onthemap-api.udacity.com/v1/session"
    static let signUpUrl = "https://auth.udacity.com/sign-up"
    static let notValid = "Credentials not Valid"
    static let userName = "username"
    static let passWord = "password"
    
    static let sessionId = ""
    static let headerJsonFormat = "application/json"
    static let headerContentType = "Content-Type"
    static let headerAccept = "Accept"
    static let headerPost = "POST"
    static let headerGet = "GET"
    static let headerDelete = "DELETE"
    static let limit = "100"
    
}
