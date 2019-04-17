//
//  AuthenticateStore.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/16/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation

struct AuthenticateStore {
    static let loginUrl = "https://onthemap-api.udacity.com/v1/session"
    static let signUpUrl = "https://auth.udacity.com/sign-up"
    static let notValid = "Credentials not Valid"
    static let userName = "username"
    static let passWord = "password"
    static let httpMethod = "POST"
    //Raw Value is String
    enum UserInfo: String {
        case userInputName = "darinjswilliams@icloud.com"
        case passWordInput = "Armenia0608"
        case udacity = "udacity"
    }
    
}
