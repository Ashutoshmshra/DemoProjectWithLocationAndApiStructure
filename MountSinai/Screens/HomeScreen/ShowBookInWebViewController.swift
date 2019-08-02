//
//  ShowBookInWebViewController.swift
//  MountSinai
//
//  Created by Praveen on 22/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class ShowBookInWebViewController: BaseViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var showBookURLWebView: UIWebView!
    var urlString = String()
    var bookURLString = String ()
    var showHeader = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        showBookURLWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
//        showBookURLWebView.loadRequest(URLRequest(url: URL(string: bookURLString)!))
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .gray
        activityIndicator.center = CGPoint(x: 0, y: 0)
        setNavigationBar()
        showBookURLWebView.scrollView.showsVerticalScrollIndicator = false
        showBookURLWebView.scrollView.showsHorizontalScrollIndicator = false
        
    }
    
}
// MARK:- UIWebView Delegate
extension ShowBookInWebViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
        if showHeader == false {
        webView.stringByEvaluatingJavaScript(from: "window.addEventListener('load', function () {document.getElementById('div-headline').style.display = 'none'; document.getElementById('banner-cont-local').style.display = 'none'; document.getElementById('div-footer').style.display = 'none'; document.getElementById('div_list_TagCloud_ajax').style.display = 'none';}, false);")
        
        webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('header').remove(); $('#s-lg-guide-header-info2').remove();$('#mobile-breadcrumbs').remove();$('#s-lc-public-bc').remove();$('#s-lg-col-2').remove();$('#s-lg-guide-tabs.col-md-3 s-lg-tabs-side pad-bottom-med').remove();$('.nav nav-pills nav-stacked').remove();$('footer.gc-02-footer').remove();})")
            
            webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('header').remove(); $('#s-lg-tabs-container .s-lg-tabs-side').remove();$('#s-lg-guide-header-info2').remove();$('#mobile-breadcrumbs').remove();$('#s-lg-guide-header-search').remove();$('#s-lg-col-2').remove();$('#s-lg-guide-tabs.col-md-3 s-lg-tabs-side pad-bottom-med').remove();$('.nav nav-pills nav-stacked').remove();$('footer.gc-02-footer').remove();$('main.institute-detail').css('padding-top','20px');$('html, body').animate({ scrollTop: 0 });})")
        
            
            
            webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('header').remove(); })")
            
            //        To remove header Ask for library- s-la-page-title-bar
            webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('#s-la-public-header').remove(); })")
            webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('#s-la-page-title-bar').remove(); })")
            
            webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('footer.gc-02-footer').remove(); })")
            
            
            
            webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('.s-la-public-header-text').css('margin-top','0px'); })")
            
            
            webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('#s-la-page-column-1').remove(); $('#s-la-box-11016-container').remove(); $('#s-la-box-41835-container').remove(); $('#s-la-box-47191-container').remove(); $('#s-la-box-41837-container').remove();})")
        
    }
        else {
            
            
            
        }
        
        
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
   
//        webView.stringByEvaluatingJavaScript(from: "window.addEventListener('load', function () {document.getElementById('div-headline').style.display = 'none'; document.getElementById('banner-cont-local').style.display = 'none'; document.getElementById('div-footer').style.display = 'none'; document.getElementById('div_list_TagCloud_ajax').style.display = 'none';}, false);")
//        
//         webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('header').remove(); $('#s-lg-guide-header-info2').remove();$('#mobile-breadcrumbs').remove();$('#s-lc-public-bc').remove();$('#s-lg-col-2').remove();$('#s-lg-guide-tabs.col-md-3 s-lg-tabs-side pad-bottom-med').remove();$('.nav nav-pills nav-stacked').remove();$('footer.gc-02-footer').remove();})")

    }
}
