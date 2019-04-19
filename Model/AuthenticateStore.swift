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
    static let sessionId = ""
    static let jsonFormat = "applicaiton/json"
    static let contentType = "Content-Type"
    //Raw Value is String
    enum UserInfo: String {
        case emailAddress = "darinjswilliams@icloud.com"
        case passWord = "Armenia0608"
        case udacity = "udacity"
    }
    
    enum Endpoints {
        static let base = "https://onthemap-api.udacity.com/v1/session"
       
        case login
        case logout
        case body
        
        var stringValue: String {
            switch self {
            case .login: return Endpoints.base
                
            case .body: return "{\"udacity\": {\"username\": \"\(UserInfo.emailAddress)\", \"password\": \"\(UserInfo.passWord)\"}}"
            case .logout: return ""
  
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
}
