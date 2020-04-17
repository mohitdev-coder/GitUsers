//
//  WebserviceClass.swift
//  GitTest
//
//  Created by Admin on 14/04/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import Alamofire
import AFNetworking

class WebserviceClass: NSObject {
    //MARK: Reachability
    //let reachability = Reach()
    let indicator = ActivityIndicator()
    
    //MARK: Reachability checks
    //    func Check_networkConnection() ->Bool {
    //        if isReachable(){
    //            return true
    //        }else {
    //            Notreachable()
    //            return false
    //        }
    //    }
    //    func isReachable() -> Bool {
    //        if  reachability.connectionStatus().description != "Offline"{
    //            return true
    //        }
    //        return false
    //    }
    
    //    func Notreachable(){
    //        UtilityClass.showToast(message: "No Internet Connection")
    //    }
    
    //MARK:GET_webservice_Without_Header_request
    func GET_webservice_Without_Auth_request(Url: String, background:Bool, completion: @escaping ( _ result: NSArray, _ isError: Bool, _ statusCode: NSInteger) -> Void)
    {
        
        if !background {
            indicator.show()
        }
        
        let url = URL(string: Url)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        Alamofire.request(urlRequest).responseJSON { (responseData) -> Void in
            if !background{
                self.indicator.hide()
            }
            if let result : NSArray = responseData.result.value as? NSArray {
                if responseData.result.isSuccess == true{
                    completion(result, false, 200)
                }else{
                    UtilityClass.showToast(message: "server error")
                }
            }else{
                UtilityClass.showToast(message: "server error")
            }
        }
    }
    
    //MARK:GET_webservice_Without_Header_request
    func GET_webservice_request(Url: String, background:Bool, completion: @escaping ( _ result: NSDictionary, _ isError: Bool, _ statusCode: NSInteger) -> Void)
    {
        
        if !background {
            indicator.show()
        }
        
        let url = URL(string: Url)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        Alamofire.request(urlRequest).responseJSON { (responseData) -> Void in
            if !background{
                self.indicator.hide()
            }
            if let result : NSDictionary = responseData.result.value as? NSDictionary {
                if responseData.result.isSuccess == true{
                    completion(result, false, 200)
                }else{
                    UtilityClass.showToast(message: "server error")
                }
            }else{
                UtilityClass.showToast(message: "server error")
            }
        }
    }
}

