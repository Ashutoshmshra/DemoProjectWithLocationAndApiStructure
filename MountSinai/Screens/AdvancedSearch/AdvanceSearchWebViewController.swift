//
//  AdvanceSearchWebViewController.swift
//  MountSinai
//
//  Created by Praveen on 19/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit
//import  WKWebView

class AdvanceSearchWebViewController: BaseViewController {
    
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
    var urlString = "https://mountsinai.on.worldcat.org/advancedsearch?databaseList=638"
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backArrowImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.loadRequest(URLRequest(url: URL(string: urlString)!))

      
     
            
    
        loadSpinner.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        loadSpinner.style = .gray
        loadSpinner.center = CGPoint(x: 0, y: 0)
        webview.scrollView.showsVerticalScrollIndicator = false
        webview.scrollView.showsHorizontalScrollIndicator = false
//    setnavigationWithoutBack()
//       setNavigationBar()
        setNavigationBarWithRight()
//        self.navigationController?.isNavigationBarHidden = true
        
        let  leftButton = UIButton(type: UIButton.ButtonType.custom)
        leftButton.frame = CGRect(origin: .zero, size: CGSize(width: 36, height: 36))
        leftButton.clipsToBounds = true
        leftButton.setImage(UIImage(named: "back_arrow"), for: .normal) // add custom image
        leftButton.addTarget(self, action: Selector(("onBackButton_Clicked:")), for: UIControl.Event.touchUpInside)
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = leftButton
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(){
//        
////        if(webview.canGoBack){
////            backArrowImage.isHidden = false
////            backBtn.isHidden = false
////            webview.reload()
////        }
////        else{
////            backArrowImage.isHidden = true
////            backBtn.isHidden = true
////            webview.reload()
//      }
     
    }
    
    func hidebacbutton(){
        if webview.canGoBack == false {
            backBtn.isHidden = true
            backArrowImage.isHidden = true
            
        }
        else {
            backBtn.isHidden =  false
            backArrowImage.isHidden = false
            //                    self.selectedIndex = priorIndex
            //                    self.collectionView.reloadData()
        }
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func onBackButton_Clicked(sender: UIButton)
    {
        if(webview.canGoBack) {
            webview.goBack()
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func actionBackButton(_ sender: UIButton) {
         webview.goBack()
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
//    @IBAction func reload(sender: UIButton) {
//
//        webview.reload()
//
//    }
    @IBAction func actionReloadButton(_ sender: UIButton) {
        webview.scrollView.scrollsToTop = true
       webview.reload()

        
    }
    @IBAction func backButton(_ sender: UIButton) {
        webview.scrollView.scrollsToTop = true
        webview.goBack()

        
    }
    
    @IBAction func actionForwardButton(_ sender: UIButton) {
        
        webview.goForward()
    }
    //    @IBAction func back(sender: UIBarButtonItem) {
//        
//        webview.goBack()
//        
//    }
//    @IBAction func forward(sender: UIButton) {
//
//        webview.goForward()
//
//    }
}

extension AdvanceSearchWebViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadSpinner.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadSpinner.stopAnimating()
        loadSpinner.hidesWhenStopped = true
        hidebacbutton()
//        webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('header[role=banner]').remove(); $('.limiters_module .scope').css('min-width','100%');$('#footer').remove(); })")
//       webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('#footer').remove(); })")
//        webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('footer.footer-content contrast_text').remove(); })")
    }
}
