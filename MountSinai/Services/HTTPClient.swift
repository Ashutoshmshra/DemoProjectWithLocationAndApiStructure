
//
//  HTTPClient.swift
//
//  Created by Mobikasa on 09/10/17.
//  Copyright © 2017 mobikasa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SVProgressHUD
//import SwiftyJSON

typealias CompletionBlock = (Dictionary<String, Any>?,Int, Error?) -> (Void)
typealias ProgressBlock = (Float) -> (Void)

class HTTPClient : NSObject{
    
    private override init() {
        super.init()
        
        
    }
    static var shared :HTTPClient? {
        
        if (NetworkReachabilityManager()?.isReachable)! == true {
            
            return HTTPClient()
            
        }
        else{
            
            Alamofire.SessionManager.default.session.getAllTasks { (tasks) in
                tasks.forEach({ (task) in
                    task.cancel()
                    let alertController = UIAlertController(title: "", message: AlertText.NetworkAlert, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: AlertText.OKButtonText, style: .default, handler: nil)
                    alertController.addAction(alertAction)
                    
                })
            }
            
        }
        return nil
    }
    
    
    
    func setHTTPRequest(withAPIUrl url: String, withHttpMethod method: HTTPMethod, withParameters params: [String: Any]?) -> URLRequest? {
        
        let headers: [String:String] = setAllAuthenticationKeys()
        
        var request: URLRequest? = nil
        do {
            request = try URLRequest.init(url: url, method: method, headers: headers)
            request?.timeoutInterval = 180
            if params != nil {
                request?.httpBody = try! JSONSerialization.data(withJSONObject: params!, options: [])
            }
        }
        catch {
            print("****** exception in Http Request ********")
        }
        
        return request
    }
    
    
    func PostHTTPRequest(baseUrl:String, params:[String:Any], completionBlock:@escaping CompletionBlock) -> Void {
        
        let request = setHTTPRequest(withAPIUrl: baseUrl, withHttpMethod: .post, withParameters: params)
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.clear)
        Alamofire.request(request! as URLRequestConvertible).responseJSON { (responseData: DataResponse<Any>) in
            SVProgressHUD.dismiss()
            switch (responseData.result){
                
            case .success(_):
                
                if let response = responseData.response?.allHeaderFields{
                    if let accesstoken = responseData.response?.allHeaderFields["token"] as? String{
                        if accesstoken != ""{
                            AppConstants.SaveUserDefaults(value: accesstoken, key: AppConstants.ACCESSTOKEN)
                            AppConstants.SaveUserDefaults(value: true, key: AppConstants.ISLOGIN)
                        }
                        
                    }
                    
                    
                }
                
                completionBlock(responseData.result.value as? [String : Any] ,(responseData.response?.statusCode) ?? 0,responseData.result.error)
                
                break
            case .failure(let error):
                
                if (responseData.result.value == nil) {
                    
                    if error._code == NSURLErrorNotConnectedToInternet{
                        completionBlock(nil ,600,responseData.result.error)
                        
                    } else if responseData.response?.statusCode == 500 {
                        completionBlock(nil ,500,"Unable to connect to server. Please try again after sometime." as? Error)
                        
                    }
                    else{
                        completionBlock(nil ,(responseData.response?.statusCode) ?? 0,responseData.result.error)
                    }
                }
                else{
                    completionBlock(responseData.result.value as? [String : Any] ,(responseData.response?.statusCode) ?? 0,responseData.result.error)
                }
                break
            }
        }
    }
    
    
    func setAllAuthenticationKeys() -> [String:String] {
        
        //        var headers: [String:String] = [
        //            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
        //            "Content-Type": "application/x-www-form-urlencoded"
        //        ]
        let nsObject: AnyObject? = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as AnyObject
        let version = nsObject as! String
        
        var headers: [String:String] = [
            
            "Content-Type": "application/json",
            "Accept" : "application/json",
            "device_type": "ios",
            "device_id": UIDevice.current.identifierForVendor!.uuidString,
            ]
        
        if let token = AppConstants.GetUserDefaults(key: AppConstants.ACCESSTOKEN){
            headers["token"] = token as! String
        }
        return headers
    }
    
    
    func getRequest(baseUrl:String,completionBlock:@escaping CompletionBlock ){
        let request = setHTTPRequest(withAPIUrl: baseUrl, withHttpMethod: .get, withParameters: nil)
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.clear)
        Alamofire.request(request! as URLRequestConvertible).responseJSON { (responseData: DataResponse<Any>) in
            SVProgressHUD.dismiss()
            switch (responseData.result){
            case .success(_):
                if let response = responseData.result.value{
                    completionBlock(responseData.result.value as? [String:Any], (responseData.response?.statusCode) ?? 0, responseData.result.error)
                }
                break
                
            case .failure(let error):
                if ( responseData.result.value == nil){
                    
                    if error._code == NSURLErrorNotConnectedToInternet || error._code == NSURLErrorTimedOut{
                        if(error._code == -1005){
                            
                        }
                        else{
                            completionBlock(nil ,600 ,responseData.result.error)
                        }
                        
                        
                    }
                        
                    else if responseData.response?.statusCode == 500{
                        completionBlock(nil,(responseData.response?.statusCode) ?? 0, "Unable to connect to server. Please try again after sometime." as? Error)
                    }
                        
                    else{
                        completionBlock(nil,(responseData.response?.statusCode) ?? 0,responseData.result.error)
                    }
                }
                else{
                    completionBlock(responseData.result.value as? [String:Any],
                                    (responseData.response?.statusCode) ?? 0 , responseData.result.error)
                }
                
                break
                
            }
        }
    }
}





