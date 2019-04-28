//
//  SessionModel.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/21/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation

struct SessionModel: Codable {
    static var userData: StudentData?
    static var session: SessionResponse?
    static var students: [StudentLocations] = []
}

