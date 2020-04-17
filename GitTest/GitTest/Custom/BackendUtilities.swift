//
//  BackendUtilities.swift
//  GitTest
//
//  Created by Admin on 14/04/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import Alamofire

class BackendUtilities: NSObject {
  static let webService = WebserviceClass()
    
    class func searchGITUser(_ user: String, completionHandler:@escaping (NSArray, NSInteger, String)->()){
          let strUrl = "https://api.github.com/search/users?q=\(user)&page=1&per_page=100"
          webService.GET_webservice_request(Url: strUrl, background: true, completion: {Result, isError, statusCode  in
            if !isError{
                let status = Result["items"] as! NSArray
                completionHandler(status, 200, "")
            }
          })
      }
    
    class func clickedDetailsUser(_ user: String, completionHandler:@escaping (NSDictionary, NSInteger, String)->()){
        let strUrl = "https://api.github.com/users/\(user)"
        webService.GET_webservice_request(Url: strUrl, background: true, completion: {Result, isError, statusCode  in
          if !isError{
            let intStatus =  Result
            completionHandler(intStatus, 200, "")
          }
        })
    }
    
    class func clickedDetailSearch(_ user: String,_ topic: String, completionHandler:@escaping (NSArray, NSInteger, String)->()){
        let strUrl = "https://api.github.com/users/\(user)/repos?q=\(topic)&page=1&per_page=100"
        webService.GET_webservice_Without_Auth_request(Url: strUrl, background: true, completion: {Result, isError, statusCode  in
          if !isError{
            let intStatus =  Result
            completionHandler(intStatus, 200, "")
          }
        })
    }
}
