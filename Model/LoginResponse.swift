//
//  LoginResponse.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/18/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

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

extension LoginResponse: LocalizedError {
    var errorDescription: String? {
        return statusMessage
    }
}
