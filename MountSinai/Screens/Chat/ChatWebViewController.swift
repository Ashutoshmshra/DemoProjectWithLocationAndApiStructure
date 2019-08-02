//
//  ChatWebViewController.swift
//  MountSinai
//
//  Created by Praveen on 19/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class ChatWebViewController: BaseViewController {
    
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var backImage: UIImageView!
    
    var urlString = "https://askalibrarian.mssm.edu/index.php"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.loadRequest(URLRequest(url: URL(string: urlString)!))
        loadSpinner.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        loadSpinner.style = .gray
        loadSpinner.center = CGPoint(x: 0, y: 0)
        webview.scrollView.showsVerticalScrollIndicator = false
        webview.scrollView.showsHorizontalScrollIndicator = false

//          setNavigationBar()
        setNavigationWithoutRight()
        
//        setnavigationWithoutBack()
//        navigationController?.navigationBar.r
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        if webview.canGoBack != nil {
//            backImage.isHidden = false
//            webview.goBack()
//               }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func hidebacbutton(){
        if webview.canGoBack == false {
            backButton.isHidden = true
            backImage.isHidden = true
            
        }
        else {
            backButton.isHidden =  false
            backImage.isHidden = false
            //                    self.selectedIndex = priorIndex
            //                    self.collectionView.reloadData()
        }
    }

    
    func openSocialSitePage(openSocialSiteHandle: String) {
        guard let url = URL(string: openSocialSiteHandle)  else { return }
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    
    @IBAction func actionFacebookButton(_ sender: UIButton) {
        openSocialSitePage(openSocialSiteHandle: "https://www.facebook.com/Levy.Library/")
    }
    
    @IBAction func actionTwitterButton(_ sender: UIButton) {
        openSocialSitePage(openSocialSiteHandle: "https://twitter.com/@Levy_Library")
    }
    
    @IBAction func actionInstaButton(_ sender: Any) {
        openSocialSitePage(openSocialSiteHandle:  "https://www.instagram.com/levy_library/")
    }
 
   
    @IBAction func actionYoutubeButton(_ sender: UIButton) {
        openSocialSitePage(openSocialSiteHandle: "https://www.youtube.com/channel/UCajDQZEzWE8OlDhVzJbu20g")
    }
    
    @IBAction func actionSnapchatButton(_ sender: UIButton) {
        openSocialSitePage(openSocialSiteHandle: "https://www.snapchat.com/add/levy_library")
    }
    
    
    @IBAction func actionBlogButton(_ sender: UIButton) {
        openSocialSitePage(openSocialSiteHandle: "https://libguides.mssm.edu/blog")
    }
    
    
    
    
    
    @IBAction func actionBackButton(_ sender: UIButton) {
//        if webview.canGoBack != nil {
            webview.goBack()
//        }
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func actionReloadButton(_ sender: UIButton) {
        webview.scrollView.scrollsToTop = true
        webview.reload()
        
        
    }
    @IBAction func backButton(_ sender: UIButton) {
//        webview.scrollView.scrollsToTop = true
        webview.goBack()
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let currentYOffset: CGFloat = scrollView.contentOffset.y
//        let topIntest: CGFloat = scrollView.contentInset.top
//        scrollView.contentOffset = CGPoint(x: scrollView.contentOffset.x, y: currentYOffset - topIntest)
//    }
}
//MARK:- UIWebView Delegate

extension ChatWebViewController: UIWebViewDelegate {
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadSpinner.startAnimating()
        webView.scrollView.contentInset = UIEdgeInsets.zero
        webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('header').remove(); })")
        
//        To remove header Ask for library- s-la-page-title-bar
         webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('#s-la-public-header').remove(); })")
        webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('#s-la-page-title-bar').remove(); })")
        
        webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('footer.gc-02-footer').remove(); })")
        
        
        
        webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('.s-la-public-header-text').css('margin-top','0px'); })")
        
        
        webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('#s-la-page-column-1').remove(); $('#s-la-box-11016-container').remove(); $('#s-la-box-41835-container').remove(); $('#s-la-box-47191-container').remove(); $('#s-la-box-41837-container').remove();})")
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadSpinner.stopAnimating()
        loadSpinner.hidesWhenStopped = true
        hidebacbutton()
        
    }
}
