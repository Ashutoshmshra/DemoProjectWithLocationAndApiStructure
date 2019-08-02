//
//  BaseViewController.swift
//  MountSinai
//
//  Created by Praveen on 16/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func push(_ vc:UIViewController) {
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func alertFunction(message:String)
    {
        //        self.showSingleBtnAlertWith(title: AlertText.AlertTitleText, subTitle: message, centerBtnTitle: AlertText.OKButtonText, centerBtnAction: {})
        /*
         let alert = UIAlertController(title: AlertText.AlertTitleText, message: message, preferredStyle: .alert)
         let okAction = UIAlertAction(title: AlertText.OKButtonText, style: .default, handler: nil)
         alert.addAction(okAction)
         self.present(alert, animated: true, completion: nil)
         */
    }
    
    func setnavigationWithoutBack() {
        let screenWidth = Int(UIScreen.main.bounds.size.width)
        let screenHeight = UIScreen.main.bounds.size.height
        let navBarHeight = 70
        var topMargin = 0
        if screenHeight > 820 {
            topMargin = 25
        }
        let navBarFrame = CGRect.init(x: 0, y: topMargin, width: screenWidth, height: navBarHeight)
        let navigationBar = MBNavBar.init(frame: navBarFrame)
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.addSubview(navigationBar)
        navigationBar.showLeftNavBarButton(false)
        navigationBar.showRightNavBarButton(false)
        
//        navigationBar.showLeftNavBarButton(<#T##showButton: Bool##Bool#>)
    }
    
    func alertForInternet(){
        let alert = UIAlertController(title: "Alert", message: "Please check your internet connection.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func setNavigationBar() {
        Utilities.sharedInstance.addNavigationBar(toViewController: self)
     Utilities.sharedInstance.unhideAllButtonOfNavBar()
//        let screenWidth = Int(UIScreen.main.bounds.size.width)
//        let screenHeight = UIScreen.main.bounds.size.height
//        let navBarHeight = 70
//        var topMargin = 0
//        if screenHeight > 820 {
//            topMargin = 25
//        }
//        let navBarFrame = CGRect.init(x: 0, y: topMargin, width: screenWidth, height: navBarHeight)
//        let navigationBar = MBNavBar.init(frame: navBarFrame)
//
//        Utilities.sharedInstance.addNavigationBar1(toViewController: self)
//
//        navigationBar.rightBarButton.isHidden = false
//        navigationBar.rightBarButton.isHidden = false
    }
    
    @objc func onBackButtonPressed(button:UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    func  setNavigationBarWithRight() {
        let screenWidth = Int(UIScreen.main.bounds.size.width)
        let screenHeight = UIScreen.main.bounds.size.height
        let navBarHeight = 70
        var topMargin = 0
        if screenHeight > 820 {
            topMargin = 25
        }
        let navBarFrame = CGRect.init(x: 0, y: topMargin, width: screenWidth, height: navBarHeight)
        let navigationBar = MBNavBar.init(frame: navBarFrame)
        
         Utilities.sharedInstance.addNavigationBar1(toViewController: self)
         navigationBar.leftBarButton.isHidden = true
        navigationBar.leftBarImage.isHidden = true
        
    
    }
    
    func setNavigationWithoutRight() {
//        let screenWidth = Int(UIScreen.main.bounds.size.width)
//        let screenHeight = UIScreen.main.bounds.size.height
//        let navBarHeight = 70
//        var topMargin = 0
//        if screenHeight > 820 {
//            topMargin = 25
//        }
        
        Utilities.sharedInstance.addNavigationBar(toViewController: self)
        Utilities.sharedInstance.hideRightButtonOnNavBar()
    }
    
    
    
}
