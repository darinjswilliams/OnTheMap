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
    
    static var sessionId = ""
    static let headerJsonFormat = "application/json"
    static let headerContentType = "Content-Type"
    static let headerAccept = "Accept"
    static let headerPost = "POST"
    static let headerGet = "GET"
    static let headerDelete = "DELETE"
    static let limit = "100"
    static var userKey = ""
    static var headerUserKey = "User-Key"
    static var parseAppId = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
    static var parseApiKey = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
    static var headerParseAppId = "X-Parse-Application-Id"
    static var headerParseAppKey = "X-Parse-REST-API-Key"
    
}
