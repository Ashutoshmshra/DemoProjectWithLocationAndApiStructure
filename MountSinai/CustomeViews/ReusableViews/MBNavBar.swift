//
//  MBNavBar.swift
//  K2Intelligence
//
//  Created by Mobikasa_Umesh on 20/10/17.
//  Copyright © 2017 Mobikasa. All rights reserved.
//

import UIKit

class MBNavBar: UIView {
    
    //view objects
    @IBOutlet weak var leftBarImage: UIImageView!
    @IBOutlet weak var rightBarImage: UIImageView!
    @IBOutlet var leftBarButton: UIButton!
    @IBOutlet var titleImageView: UIImageView!
    
    @IBOutlet weak var navigationImage: UIImageView!
    
    @IBOutlet weak var rightBarButton: UIButton!
    //Closure 
    var leftButtonTappedClosure:(() -> Void)?
    var rightButtonTappedClosure: (() -> Void)?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds =  false
        self.layer.cornerRadius = 0.0
        self.layer.shadowColor = UIColor.darkGray.cgColor;
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 0.0
        //    self.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit(frame: frame)
    }
    private func customInit(frame: CGRect){
        var topValue:CGFloat = 0
        if UIScreen.main.nativeBounds.height == 2436 {
            topValue = 10
        }
        let xibView =  Bundle.main.loadNibNamed("MBNavBar", owner: self, options: nil)?.last as! UIView
        xibView.frame = CGRect(x: 0, y: topValue, width: frame.size.width, height: frame.size.height)
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
    }
    func test() {
        print("Web View test")
    }
    func openBlogsPage(openSocialSiteHandle: String) {
        guard let url = URL(string: openSocialSiteHandle)  else { return }
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    //view methods
    
    func showLeftNavBarButton(_ showButton: Bool){
        leftBarButton.isHidden = !showButton
        navigationImage.isHidden = !showButton
    }
    func showRightNavBarButton(_ showButton: Bool){
        rightBarButton.isHidden = showButton
        rightBarImage.isHidden = showButton
    }
//    func onBackButton_Clicked(sender: UIButton)
//    {
//        if(webview.canGoBack) {
//            webview.goBack()
//        }
//        else {
//            self.navigationController?.popViewController(animated: true)
//        }
//    }
    
    // 
    @IBAction func leftButtonTapped(_ sender: UIButton){
        if leftButtonTappedClosure != nil {
            leftButtonTappedClosure!()
        }
        
    }
    //    @IBAction func navBarButtonTapped(_ sender: UIButton){
    //        if UIApplication.shared.canOpenURL(URL.init(string: AppConstant.WebURl)!) {
    //            UIApplication.shared.open(URL.init(string: AppConstant.WebURl)!, options: ["": ""], completionHandler: nil)
    //        }
    //    }
    @IBAction func rightButtonTapped(_ sender: UIButton){
//        if UIApplication.shared.canOpenURL(URL.init(string: AppConstant.WebURl)!) {
//            UIApplication.shared.open(URL.init(string: AppConstant.WebURl)!, options: [UIApplication.OpenExternalURLOptionsKey(rawValue: ""): ""], completionHandler: nil)
//        }
//        if UIApplication.shared.canOpenURL(URL.init(string: AppConstant.WebURl)!) {
//            UIApplication.shared.open(URL.init(string:AppConstant.WebURl)!, options: [ : ], completionHandler: nil)
//        }
        if rightButtonTappedClosure != nil {
            rightButtonTappedClosure!()
        }
        else {
            print("Else Part of Right Button!")
        }
//        openBlogsPage(openSocialSiteHandle: "https://askalibrarian.mssm.edu/index.php")

    }
}
