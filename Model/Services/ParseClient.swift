//
//  ParseClient.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/22/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import Foundation
import UIKit

class ParseClient {

    
    class func getStudentList(completion: @escaping ([StudentLocations]?, Error?)-> Void){
//
        requestGetStudents(url: EndPoints.getStudentLimit.url) { (response, error) in
        
            guard let response = response else {
                print("requestLimitedStudents: Failed")
                completion(nil, error)
                return
            }
            print("getStudentList..\(response)")
            completion(response,error)
        }
    }
    
    class func getSortedStudentList(completion: @escaping ([StudentLocations]?, Error?)-> Void){
        
        requestGetStudents(url: EndPoints.getStudentOrder.url) { (response, error) in
            
            guard let response = response else {
                print("requestSortedStudentLists: Failed")
                completion(nil, error)
                return
            }
            print("getStudentList..\(response)")
            completion(response,error)
        }
    }
    
    
    
    class func requestGetStudents(url: URL, completion: @escaping ([StudentLocations]?,Error?)->Void) {
        var request = URLRequest(url: url)
       
        request.addValue("QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr", forHTTPHeaderField: "X-Parse-Application-Id")
        request.addValue("QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY", forHTTPHeaderField: "X-Parse-REST-API-Key")
        
        let downloadTask = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            // guard there is data
            guard let data = data else {
                // TODO: CompleteHandler can return error
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let result = try jsonDecoder.decode(SearchResults.self, from: data)
                DispatchQueue.main.async {
                    print("requestGetStudentlist..\(result)")
                    completion(result.results, nil)
                }
                
            } catch {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }
        }
        
        downloadTask.resume()
    }

    
    class func taskForStudentGetRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completionHandler: @escaping (ResponseType?, Error?) -> Void) {
        var request = URLRequest(url: url)
        
        request.httpMethod = AuthenticateStore.headerGet
//        request.httpBody = try! JSONEncoder().encode(body)
        
//        request.addValue(AuthenticateStore.headerJsonFormat, forHTTPHeaderField:        AuthenticateStore.headerAccept)
//        request.addValue(AuthenticateStore.headerJsonFormat, forHTTPHeaderField: AuthenticateStore.headerContentType)
        request.addValue("QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr", forHTTPHeaderField: "X-Parse-Application-Id")
        request.addValue("QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY", forHTTPHeaderField: "X-Parse-REST-API-Key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            print("taskForGetRequest... \(data)")
            print(data.count)
            
            
            let range = Range(5..<data.count)
            let newData = data.subdata(in: range) /* subset response data! */
//            print(String(data: newData, encoding: .utf8)!)
            
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: newData)
                DispatchQueue.main.async {
                    print("ResponseObject \(responseObject)")
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
}

