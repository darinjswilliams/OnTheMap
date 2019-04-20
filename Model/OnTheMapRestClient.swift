//
//  RestClientInfor.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/16/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation

class OnTheMapRestClient  {
    

    class func loginClient(username: String, password: String, completionHandler: @escaping (Bool, Error?) -> Void) {
        
        //Pass in the Login URL
        var request = URLRequest(url: EndPoints.loginBase.url)

        request.httpMethod = AuthenticateStore.headerPost
        request.addValue(AuthenticateStore.headerJsonFormat, forHTTPHeaderField:        AuthenticateStore.headerAccept)
        request.addValue(AuthenticateStore.headerJsonFormat, forHTTPHeaderField: AuthenticateStore.headerContentType)

        //set the encoder on the body
        let requestBody = LoginRequest(udacity: UserCredentials(username: username, password: password))
        
        request.httpBody = try! JSONEncoder().encode(requestBody)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            //Check to see if data is nil, if nil send error to completionhandler and exit
            guard let data = data else {
                DispatchQueue.main.async {
                      completionHandler(false, error)
                   }
                     return
                 }

            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 || statusCode >= 400 else {
                DispatchQueue.main.async {
                    completionHandler(false, error)
                }
                return
            }
            
              do {
                
                
                let range = Range(5..<data.count)
                let newData = data.subdata(in: range) /* subset response data! */
                print(String(data: newData, encoding: .utf8)!)
                
                let responseSession = try JSONDecoder().decode(SessionResponse.self, from: newData)
                print("responseSession:..", responseSession)
                
                DispatchQueue.main.async {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                    }
                    completionHandler(true, error)
                }
                
               
            } catch {
                do{
                
                 let errorResponse = try JSONDecoder().decode(LoginResponse.self, from: data ) as Error
                            DispatchQueue.main.async {
                                 completionHandler(false, errorResponse)
                            }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(false, error)
                    }
                    
                }
            }
        }
            task.resume()
        
    }
    
    private func post(urlName: URL, body: LoginRequest,  completionHandler: @escaping (Bool, Error?) -> Void){
        
    
    }
    
    private func callWebService(request: URLRequest, completionHandler: @escaping (Bool, Error?) -> Void){
        
    }
    
}
