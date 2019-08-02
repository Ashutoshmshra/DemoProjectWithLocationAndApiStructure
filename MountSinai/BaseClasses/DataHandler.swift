//
//  DataHandler.swift
//  MountSinai
//
//  Created by Praveen on 22/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
class DataHandler: NSObject{
    static  func getUserModel()-> HomeDataClass?{
        if let userData: Data = AppConstants.GetUserDefaults(key: AppConstants.USERDETAILS) as? Data{
            do{
                let newObject = try JSONDecoder().decode(HomeDataClass.self, from: userData as Data)
                return newObject
            }
                
            catch{
                print("not able to encode data")
            }
        }
        else{
            print("unable to fetch user data")
        }
        return nil
    }
}
