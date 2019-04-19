//
//  RestClientInfor.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/16/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation

class OnTheMapRestClient  {
    
    
    //Define end points
    enum Endpoints {
    
        case login
        
        var stringValue: String{
            switch self {
            case .login:
                return ""
            
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
        
    }
 }

    class func loginClient(username: String, password: String, completionHandler: @escaping (Bool, Error?) -> Void) {
        
        //Pass in the Login URL
        var request = URLRequest(url: AuthenticateStore.Endpoints.login.url)
        
        //Set the httpMethod
        request.httpMethod = AuthenticateStore.httpMethod
        
        //Tell Server the format and Content Type
        request.addValue(AuthenticateStore.jsonFormat, forHTTPHeaderField: AuthenticateStore.contentType)
        
        //set the body
//          let body = LoginRequest(username: username, password: password, authorizationToken: AuthenticateStore.UserInfo.udacity.rawValue)
        request.httpBody = "{\"udacity\": {\"username\": \"\(username)\", \"password\": \"\(password)\"}}".data(using: String.Encoding.utf8)
        
        //set the encoder on the body
//        request.httpBody = try! JSONEncoder().encode(body)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            //Check to see if data is nil, if nil send error to completionhandler and exit
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(false, error)
                }
                return
            }
            
            do {
            
//              let decoder = JSONDecoder()
//              let respnseObject = try! decoder.decode(LoginResponse.self, from: data)
                DispatchQueue.main.async {
                     completionHandler(true, nil)
                }
               
            } catch {
                DispatchQueue.main.async {
                     completionHandler(false, nil)
                }
            }
        }
            task.resume()
        
    }
    
    
}
