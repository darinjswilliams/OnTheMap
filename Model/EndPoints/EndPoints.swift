//
//  EndPoints.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/19/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation


enum EndPoints {
    
 
    case loginBase
    case logout
    case signIn
    case parseAppId
    case parseApiKey
    case getSessionId
    case deleteSessionId
    case getUserSession(String)
    case getStudentBase
    case getStudentLimit
    case getStudentsSkip
    case getStudentOrder

    
    var stringValue: String {
        switch self {
        case .loginBase: return "https://onthemap-api.udacity.com/v1"
        case .logout: return EndPoints.loginBase.stringValue + "/session"
            
        case .signIn: return "https://auth.udacity.com/sign-up"
        case .parseAppId: return "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
        case .parseApiKey: return "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
        case .getSessionId:
             return EndPoints.loginBase.stringValue + "/session"
        case .deleteSessionId:
            return EndPoints.loginBase.stringValue + "/session"
        
        case .getUserSession(let sessionId):
            return EndPoints.loginBase.stringValue + "/users/\(sessionId)"
        
        case .getStudentBase:
            return "https://parse.udacity.com/parse/classes/StudentLocation?"
            
        case .getStudentLimit:
            return EndPoints.getStudentBase.stringValue + "limit=100"
            
        case .getStudentsSkip:
            return "https://parse.udacity.com/parse/classes/StudentLocation?Limit=200&skip=400"
        case .getStudentOrder:
            return "https://parse.udacity.com/parse/classes/StudentLocation?order=-updateAt"
       
        }
    }
    
    var url: URL {
        return URL(string: stringValue)!
    }
}
