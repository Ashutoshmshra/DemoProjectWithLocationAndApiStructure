//
//  ErrorHandler.swift
//
//  Created by Mobikasa_Umesh on 03/11/17.
//  Copyright © 2017 Mobikasa. All rights reserved.
//

import UIKit

typealias ErrorHandlerBlock = ((String, String) -> Void)

class ErrorHandler: NSObject {
    
    static var sharedInstance = ErrorHandler()
    var errorHandlerBlock:((String, String) -> Void)?
    
    func handleError( errorDetail: [String: Any], errorHandlerBlock:ErrorHandlerBlock){
        var errorTitle = ""
        var errorMsg = ""
        var errorDict : [String: Any]?
        if errorDetail["error"] is String {
            errorMsg = errorDetail["error"] as! String
            errorTitle = "Error"
        }
        else if errorDetail["message"] != nil{
            errorMsg = errorDetail["message"] as! String
            errorTitle = "Error"
        }
        else{
            errorDict = errorDetail["error"]! as? [String: Any]
            let allErrorKeys = (errorDict as AnyObject).allKeys
            print(errorDict!)
            print(allErrorKeys!)
            if ((allErrorKeys?.count)! > 0) {
                //Error hai
                errorTitle = allErrorKeys?.first as! String
                errorMsg = (errorDict?[errorTitle] as! Array).first!
                print(errorTitle)
                print(errorMsg)
                errorTitle = errorTitle.capitalized
            }
        }
      
        errorHandlerBlock(errorTitle, errorMsg)
    }
    
}
