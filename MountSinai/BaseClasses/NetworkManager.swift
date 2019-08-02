//
//  NetworkManager.swift
//  MountSinai
//
//  Created by Praveen on 22/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class NetworkManager {
    
    //shared instance
    static let shared = NetworkManager()
    private init(){}
    
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    
    func startNetworkReachabilityObserver() {
        
        reachabilityManager?.listener = { status in
            switch status {
                
            case .notReachable:
                print("The network is not reachable")
                
            case .unknown :
                print("It is unknown whether the network is reachable")
                
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")
                
            case .reachable(.wwan):
                print("The network is reachable over the WWAN connection")
                
            }
        }
        
        // start listening
        reachabilityManager?.startListening()
    }
}
