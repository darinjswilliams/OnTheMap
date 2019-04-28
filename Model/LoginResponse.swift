//
//  LoginResponse.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/18/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//
//Error Codes that can be included in custom Error Enum
//400 Bad Request
//401 Unauthorized
//403 Forbidden
//404 Not Found
//405 Method Not Allowed
//406 Not Acceptable
//407 Proxy Authentication Required
//408 Request Timeout
//409 Conflict
//410 Gone
//411 Length Required
//412 Precondition Failed
//413 Payload Too Large
//414 URI Too Long
//415 Unsupported Media Type
//416 Range Not Satisfiable
//417 Expectation Failed
//418 I'm a teapot
//422 Unprocessable Entity
//425 Too Early
//426 Upgrade Required
//428 Precondition Required
//429 Too Many Requests
//431 Request Header Fields Too Large
//451 Unavailable For Legal Reasons
//500 Internal Server Error
//501 Not Implemented
//502 Bad Gateway
//503 Service Unavailable
//504 Gateway Timeout
//505 HTTP Version Not Supported
//511 Network Authentication Required
import Foundation


struct LoginResponse: Codable {
    
    let success: Bool
    let expiresAt: String
    let requestToken: String
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
        case statusMessage = "status_message"
    }
}

