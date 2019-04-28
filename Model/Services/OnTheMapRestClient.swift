//
//  RestClientInfor.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/16/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation

class OnTheMapRestClient  {
    
    
    class func login(username: String, password: String, completionHandler: @escaping (Bool, Error?) -> Void) {
        let body = LoginRequest(udacity: UserCredentials(username: username, password: password))
        
    
        //Get the login base with session parameter attached
        taskForPOSTRequest(url: EndPoints.getSessionId.url, responseType: SessionResponse.self, body: body) { response, error in
            if let response = response {
                //Add session
                AuthenticateStore.sessionId = response.session.id
                AuthenticateStore.userKey = response.account.key
                completionHandler(true, nil)
            } else {
                completionHandler(false, error)
            }
        }
    }
    
    
    class func getSessionId(userID: String,completionHandler: @escaping (UserProfile?, Error?) -> Void){
        print("Looking for Following Session on user:...\(userID)")
//        let body = SessionModel.session
  
//        taskForGetRequest(url: EndPoints.getUserSession(userID).url, responseType: SessionResponse.self, body: body)
//
        
        taskForGetSingleRequest(url: EndPoints.getUserSession(userID).url, responseType: UserProfile.self) { response, error in
            if let response = response {
                //Add session
                print("getSessionId......\(response)")
//                SessionModel.session = response
                completionHandler(response, error)
            } else {
                completionHandler(nil, error)
            }
            
        }
    }
    
    class func taskForPOSTRequest<RequestType: Encodable, ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, body: RequestType, completionHandler: @escaping (ResponseType?, Error?) -> Void) {
        var request = URLRequest(url: url)
        
        request.httpMethod = AuthenticateStore.headerPost
        request.httpBody = try! JSONEncoder().encode(body)
        
        request.addValue(AuthenticateStore.headerJsonFormat, forHTTPHeaderField:        AuthenticateStore.headerAccept)
        request.addValue(AuthenticateStore.headerJsonFormat, forHTTPHeaderField: AuthenticateStore.headerContentType)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            print("taskForPOSTRequest... \(data)")
            print(data.count)
            
            let range = Range(5..<data.count)
            let newData = data.subdata(in: range) /* subset response data! */
            print(String(data: newData, encoding: .utf8)!)
            
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: newData)
                DispatchQueue.main.async {
                    completionHandler(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(OnTheMapErrorResponse.self, from: newData) as Error
                    DispatchQueue.main.async {
                        completionHandler(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                }
            }
        }
        task.resume()
    }
    
    class func taskForGetRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completionHandler: @escaping (ResponseType?, Error?) -> Void) {
        var request = URLRequest(url: url)
        
        request.httpMethod = AuthenticateStore.headerGet
        
        request.addValue(AuthenticateStore.headerJsonFormat, forHTTPHeaderField: AuthenticateStore.headerAccept)
        request.addValue(AuthenticateStore.headerJsonFormat, forHTTPHeaderField: AuthenticateStore.headerContentType)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            print(data)
            print(data.count)
            
//            let range = Range(2..<data.count)
//            let newData = data.subdata(in: range) /* subset response data! */
            print(String(data: data, encoding: .utf8)!)
            
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(OnTheMapErrorResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completionHandler(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                }
            }
        }
        task.resume()
    }
    
    
    
    class func taskForGetSingleRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completionHandler: @escaping (ResponseType?, Error?) -> Void) {
        var request = URLRequest(url: url)
        
        request.httpMethod = AuthenticateStore.headerGet
        
        request.addValue(AuthenticateStore.headerJsonFormat, forHTTPHeaderField: AuthenticateStore.headerAccept)
        request.addValue(AuthenticateStore.headerJsonFormat, forHTTPHeaderField: AuthenticateStore.headerContentType)
        request.addValue(AuthenticateStore.userKey, forHTTPHeaderField: AuthenticateStore.headerUserKey)
        request.addValue(AuthenticateStore.headerParseAppId, forHTTPHeaderField: AuthenticateStore.parseAppId)
        request.addValue(AuthenticateStore.headerUserKey, forHTTPHeaderField: AuthenticateStore.headerParseAppKey)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
   
            
            let range = Range(5..<data.count)
            let newData = data.subdata(in: range) /* subset response data! */
            print(data.count)
            print("SingleStudent Request")
            print(String(data: data, encoding: .utf8)!)
            print("EndSingleStudent Request")
            
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(OnTheMapErrorResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completionHandler(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                }
            }
        }
        task.resume()
    }
    
    class func logout(completionHandler: @escaping () -> Void) {
        var request = URLRequest(url: EndPoints.logout.url)
        request.httpMethod = AuthenticateStore.headerDelete
//        let body = LogoutRequest(sessionId: Auth.sessionId)
        let body = SessionModel.session
        
        print("logout...sesions:\(SessionModel.session)")
        request.httpBody = try! JSONEncoder().encode(body)
        request.addValue(AuthenticateStore.headerJsonFormat, forHTTPHeaderField: AuthenticateStore.headerAccept)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            SessionModel.session = nil

            completionHandler()        }
        task.resume()
    }

    
    private func callWebService(request: URLRequest, completionHandler: @escaping (Bool, Error?) -> Void){
        
    }
    
    
    
    
    
}
