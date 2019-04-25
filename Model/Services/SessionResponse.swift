//
//  SessionResponse.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/20/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//
//Example Session
//"account":{"registered":true,"key":"6758095887"},"session":{"id":"1663813473S4275ab04bad552c28ab393e91507cf3f","expiration":"2019-04-22T03:13:11.418638Z"}}
//

import Foundation

struct SessionResponse: Codable {
    let account: Account
    let session: Session
}

struct Account: Codable {
    let registered: Bool
    let key: String
}

struct Session: Codable {
    let id: String
    let expiration: String
}
