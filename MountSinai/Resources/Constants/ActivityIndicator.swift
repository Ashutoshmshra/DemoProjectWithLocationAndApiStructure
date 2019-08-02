//
//  ActivityIndicator.swift
//  MountSinai
//
//  Created by Praveen on 21/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class MKProgressView {
    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    class var shared: MKProgressView {
        struct Static {
            static let instance: MKProgressView = MKProgressView()
        }
        return Static.instance
    }
    
    func showProgressView(_ view: UIView){
        containerView.frame = view.frame
        containerView.center = view.center
        containerView.backgroundColor = UIColor(white: 0xffffff, alpha: 0.3)
        
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 0)
        progressView.center = view.center
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        view.addSubview(containerView)
        
        activityIndicator.startAnimating()
    }
    
    open func hideProgressView() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
    
    
}
