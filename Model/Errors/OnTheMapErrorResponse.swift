//
//  OnTheMapErrorResponse.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/21/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation
struct OnTheMapErrorResponse: Codable {
    let status: Int
    let error: String
}

extension OnTheMapErrorResponse: LocalizedError {
    var errorDescription: String? {
        return error
    }
}
