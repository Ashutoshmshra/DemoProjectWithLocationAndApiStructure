//
//  Constants.swift
//  MountSinai
//
//  Created by Praveen on 22/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
import  UIKit
struct AppConstants{
    
    static var ACCESSTOKEN:String = "AccessToken"
    static var ISLOGIN:String = "isLogin"
    static var USERDETAILS:String = "useDetails"
    static let WebURl = " https://libguides.mssm.edu/blog "
    
    static func SaveUserDefaults(value:Any,key:String){
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    
    static func GetUserDefaults(key:String)-> Any?{
        return (UserDefaults.standard.object(forKey: key))
    }
    
    static func SaveUserDetails(details:[String:Any]){
        
        
    }
}
struct AlertText {
    static let OKButtonText = "OK"
    static let AlertTitleText = "Alert"
    static let AlertError = "Error"
    static let AlertFacebook = "facebook login successfull"
    static let status = "The email id is invalid, Please try again!"
    static let NetworkAlert = "Cannnot connect"
    static let EmptyFields = "Please fill all the fields"
}
