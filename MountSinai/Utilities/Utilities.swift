//
//  Utilities.swift
//
//  Created by Mobikasa_Umesh on 23/10/17.
//  Copyright © 2017 Mobikasa. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class Utilities {
    static let sharedInstance = Utilities()

    
    func  addNavigationBar(toViewController viewControllerObj: UIViewController) {
        let screenWidth = Int(UIScreen.main.bounds.size.width)
        let screenHeight = UIScreen.main.bounds.size.height
        let navBarHeight = 70
        
        var topMargin = 0
        if screenHeight > 820 {
            topMargin = 25
        }
        let navBarFrame = CGRect.init(x: 0, y: topMargin, width: screenWidth, height: navBarHeight)
        let navigationBar1 = MBNavBar.init(frame: navBarFrame)
        navigationBar1.rightBarButton.isHidden = true
        navigationBar1.rightBarImage.isHidden = true
        viewControllerObj.navigationController?.navigationBar.isHidden = true
        viewControllerObj.navigationController?.setNavigationBarHidden(true, animated: false)
        viewControllerObj.view.addSubview(navigationBar1)
        
//        webviewObj.view.addSubview(navigationBar1)
        
        
        navigationBar1.leftBarButton.isSelected = false
//        navigationBar1.rightBarButton.isSelected = true
        navigationBar1.leftButtonTappedClosure = { () in
            if navigationBar1.leftBarButton.isSelected == false {
                viewControllerObj.navigationController?.popViewController(animated: true)
            }else{
                
                
            }
        }
        
//        navigationBar1.rightButtonTappedClosure = { () in
//            if navigationBar1.rightBarButton.isSelected == false {
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ShowBookInWebViewController") as! ShowBookInWebViewController
//                vc.urlString = "https://askalibrarian.mssm.edu/index.php"
//                viewControllerObj.navigationController?.pushViewController(vc, animated: true)
//
//            }else{
//                print("Else Part of Closure call in Utility")
//
//            }
//        }
        
    }
    
    func  addNavigationBar1(toViewController viewControllerObj: UIViewController) {
        let screenWidth = Int(UIScreen.main.bounds.size.width)
        let screenHeight = UIScreen.main.bounds.size.height
        let navBarHeight = 70
        
        var topMargin = 0
        if screenHeight > 820 {
            topMargin = 25
        }
        let navBarFrame = CGRect.init(x: 0, y: topMargin, width: screenWidth, height: navBarHeight)
        let navigationBar1 = MBNavBar.init(frame: navBarFrame)
        navigationBar1.leftBarImage.isHidden = true
        navigationBar1.leftBarButton.isHidden = true
        viewControllerObj.navigationController?.navigationBar.isHidden = true
        viewControllerObj.navigationController?.setNavigationBarHidden(true, animated: false)
        viewControllerObj.view.addSubview(navigationBar1)
        
        navigationBar1.rightButtonTappedClosure = { () in
            if navigationBar1.rightBarButton.isSelected == false {
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ShowBookInWebViewController") as! ShowBookInWebViewController
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChatWebViewController") as! ChatWebViewController
//                vc.urlString = "https://askalibrarian.mssm.edu/index.php"
                viewControllerObj.navigationController?.pushViewController(vc, animated: true)
                
            }else{
                print("Else Part of Closure call in Utility")
                
            }
        }
        
    }

    
    func hideRightButtonOnNavBar() {
        let screenWidth = Int(UIScreen.main.bounds.size.width)
        let screenHeight = UIScreen.main.bounds.size.height
        let navBarHeight = 70
        var topMargin = 0
        if screenHeight > 820 {
            topMargin = 25
        }
        let navBarFrame = CGRect.init(x: 0, y: topMargin, width: screenWidth, height: navBarHeight)
        let navigationBar1 = MBNavBar.init(frame: navBarFrame)
//        navigationBar1.showRightNavBarButton(false)
        navigationBar1.rightBarButton.isHidden = false
        navigationBar1.rightBarImage.isHidden = true
    }
    func unhideAllButtonOfNavBar() {
        let screenWidth = Int(UIScreen.main.bounds.size.width)
        let screenHeight = UIScreen.main.bounds.size.height
        let navBarHeight = 70
        var topMargin = 0
        if screenHeight > 820 {
            topMargin = 25
        }
        let navBarFrame = CGRect.init(x: 0, y: topMargin, width: screenWidth, height: navBarHeight)
        let navigationBar1 = MBNavBar.init(frame: navBarFrame)
        
        navigationBar1.leftBarButton.isHidden =  false
        navigationBar1.rightBarButton.isHidden = true
    }
    
    func showAlertView(withTitle title: String, andMessage message: String, onViewController viewController: UIViewController, withCompletionBlock completionBlock: @escaping ((Bool) -> Void)) {
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (alertAction) in
            completionBlock(true)
        }))
        viewController.present(alertVC, animated: true, completion: nil)
    }
    
    
    func getDeviceId() -> String {
        let deviceToken : String = UIDevice.current.identifierForVendor!.uuidString
        return deviceToken
    }
    
    
    func IsIPhoneXOrAbove() -> Bool {
        if AppDimensions.screenWidth >= 375 && AppDimensions.screenHeight >= 812 {
            return true
        }
        return false
    }
}
