//
//  MKServiceManager.swift
//  MountSinai
//
//  Created by Praveen on 22/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
import  UIKit
import Alamofire


typealias completionBlock = ([String: Any]?, Bool, NSString?, Int) -> (Void)


class MKServiceManager: NSObject {
    public static func getHomeData(pageURLIndex: Int, completionBlock:@escaping completionBlock){
        HTTPClient.shared?.getRequest(baseUrl: "\( MKServiceConstants.homeCollectionApi)\(pageURLIndex)", completionBlock:
            { (responseData, statusCode, error) -> (Void) in
                if statusCode == 200 {
                    completionBlock(responseData, true, nil, statusCode)
                }
                else {
                    completionBlock(responseData, false, error.debugDescription as NSString, statusCode)
                    print("Test response code")
                }
                
        })
    }
    public static func getHomeBookData(pageURLIndex: Int, completionBlock:@escaping completionBlock){
        HTTPClient.shared?.getRequest(baseUrl: "\( MKServiceConstants.homeBooksApi)\(pageURLIndex)", completionBlock:
            { (responseData, statusCode, error) -> (Void) in
                if statusCode == 200 {
                    completionBlock(responseData, true, nil, statusCode)
                }
                else {
                    completionBlock(responseData, false, error.debugDescription as NSString, statusCode)
                    print("Test response code")
                }
                
        })
    }
        public static func getEventData(completionBlock:@escaping completionBlock){
            HTTPClient.shared?.getRequest(baseUrl: MKServiceConstants.eventApi, completionBlock:
                { (responseData, statusCode, error) -> (Void) in
                    if statusCode == 200 {
                        completionBlock(responseData, true, nil, statusCode)
                    }
                    else {
                        completionBlock(responseData, false, error.debugDescription as NSString, statusCode)
                    }
                    
            })
        }
    
    public static func getSpecialTopicData(completionBlock:@escaping completionBlock){
        HTTPClient.shared?.getRequest(baseUrl: MKServiceConstants.specialTopicAPI, completionBlock:
            { (responseData, statusCode, error) -> (Void) in
                if statusCode == 200 {
                    completionBlock(responseData, true, nil, statusCode)
                }
                else {
                    completionBlock(responseData, false, error.debugDescription as NSString, statusCode)
                }
                
        })
    }
    
    public static func getLatestNewsData(completionBlock:@escaping completionBlock){
        HTTPClient.shared?.getRequest(baseUrl: MKServiceConstants.LatestNewsAPI, completionBlock:
            { (responseData, statusCode, error) -> (Void) in
                if statusCode == 200 {
                    completionBlock(responseData, true, nil, statusCode)
                }
                else {
                    completionBlock(responseData, false, error.debugDescription as NSString, statusCode)
                }
                
        })
    }
}
