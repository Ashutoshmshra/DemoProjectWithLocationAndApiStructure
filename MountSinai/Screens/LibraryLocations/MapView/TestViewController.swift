//
//  TestViewController.swift
//  MountSinai
//
//  Created by Praveen on 04/12/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class TestViewController: BaseViewController {

    @IBOutlet weak var backButtonImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
    @IBOutlet weak var backButton: UIButton!
    
    var arrCellData = ["Academic, Career, and Funding Resources", "Graphic\n Medicine", "LGBTQI+", "Medicine and Literature", "New York City", "Race and\n Society", "Statistics and Data Analysis"]
   let urlString = "https://libguides.mssm.edu/specialtopics/academic"
    var selectedIndex = Int ()
    var priorIndex = Int()
    var priorIndexArr = [Int]()
    var urlNewString: String?
    
//    override func loadView() {
//
//    }
    
    func webViewDidFinishLoad(webView : UIWebView) {
        //Page is loaded do what you want
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//         setnavigationWithoutBack()
        setNavigationBarWithRight()
       collectionView?.register(UINib.init(nibName: "SplashCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SplashCollectionViewCell")
        webView.loadRequest(URLRequest(url: URL(string: urlString)!))
        self.titleLabel.text = " Special Topics "
        loadSpinner.isHidden = false
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.scrollView.showsHorizontalScrollIndicator = false

        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        webView.scrollView.scrollsToTop = true

        //hidebacbutton()
    }
    
    func hidebacbutton(){
                if webView.canGoBack == false {
                    backButton.isHidden = true
                    backButtonImage.isHidden = true
        
                }
                else {
                    backButton.isHidden =  false
                    backButtonImage.isHidden = false
//                    self.selectedIndex = priorIndex
//                    self.collectionView.reloadData()
                }
    }
    
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//                if webView.canGoBack == false {
//                    backButton.isHidden = true
//                    backButtonImage.isHidden = true
//
//                }
//                else {
//                    backButton.isHidden =  false
//                    backButtonImage.isHidden = false
//                }
//
//    }
    
    @IBAction func actionBackButton(_ sender: UIButton) {
        
        if webView.canGoBack {
            webView.goBack()
    }
//        var arrcount = priorIndexArr.count
//        self.selectedIndex = priorIndexArr[arrcount-1]
//        self.priorIndexArr.remove(at: arrcount-1)
        
        
//        self.selectedIndex = priorIndex
        
        self.collectionView.reloadData()
//        if selectedIndex > priorIndex {
//
//        }
        hidebacbutton()
    }

}
extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  arrCellData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SplashCollectionViewCell", for: indexPath) as! SplashCollectionViewCell
        cell.cellTitleLabel.text = arrCellData[indexPath.row]
        cell.supportView.layer.masksToBounds =  false
        cell.supportView.layer.cornerRadius = 5.0
        cell.supportView.layer.shadowColor = UIColor.darkGray.cgColor;
        cell.supportView.layer.shadowOffset = CGSize(width: 2, height: 3)
        cell.supportView.layer.shadowOpacity = 0.2
        cell.supportView.layer.shadowRadius = 5.0
//        if selectedIndex == indexPath.row
//        {
            cell.supportView.backgroundColor = UIColor(red: 20/255, green: 153/255, blue: 239/255, alpha: 1)
            //self.priorIndex = selectedIndex
//        }
//        else
//        {
//            cell.supportView.backgroundColor = UIColor(red: 20/255, green: 153/255, blue: 239/255, alpha: 0.56)
//        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.priorIndex = selectedIndex
//        self.priorIndexArr.append(selectedIndex)
//        selectedIndex = indexPath.row
//
//
//        self.collectionView.reloadData()
      
        if indexPath.row == 0 {
             let urlNewString0 = "https://libguides.mssm.edu/specialtopics/academic"
            webView.isHidden = false
            self.webView.loadRequest(URLRequest(url: URL(string: urlNewString0)!))
        }
        else if indexPath.row == 1 {
             let urlNewString1 = "https://libguides.mssm.edu/specialtopics/graphicmed"
            
            webView.isHidden = false
            self.webView.loadRequest(URLRequest(url: URL(string: urlNewString1)!))
        }
        
       else if indexPath.row == 2 {
            let urlNewString2 = "https://libguides.mssm.edu/specialtopics/lgbtqi"
            webView.isHidden = false
             self.webView.loadRequest(URLRequest(url: URL(string: urlNewString2)!))

        }
        
        else if indexPath.row == 3 {

          let  urlNewString3  = "https://libguides.mssm.edu/specialtopics/medlit"
            webView.isHidden = false
              self.webView.loadRequest(URLRequest(url: URL(string: urlNewString3)!))

        }
        else if indexPath.row == 4 {
            let  urlNewString4 = "https://libguides.mssm.edu/specialtopics/nyc"
            webView.isHidden = false
              self.webView.loadRequest(URLRequest(url: URL(string: urlNewString4)!))

        }
        else if indexPath.row == 5 {
            let  urlNewString5 = "https://libguides.mssm.edu/specialtopics/race"
            webView.isHidden = false
              self.webView.loadRequest(URLRequest(url: URL(string: urlNewString5)!))

        }
        else  {

             let  urlNewString6 = "https://libguides.mssm.edu/specialtopics/stats"
            webView.isHidden = false
              self.webView.loadRequest(URLRequest(url: URL(string: urlNewString6)!))

        }
       
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
            return CGSize(width: 120, height: 60)
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        
        
         let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SplashCollectionViewCell", for: indexPath) as! SplashCollectionViewCell
        cell.supportView.backgroundColor = UIColor.yellow
    }
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SplashCollectionViewCell", for: indexPath) as! SplashCollectionViewCell
        cell.supportView.backgroundColor = UIColor.green
    }
    
    
}

extension TestViewController: UIWebViewDelegate {
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadSpinner.startAnimating()
       webView.stringByEvaluatingJavaScript(from: "$(document).ready(function() { $('header').remove(); $('#s-lg-tabs-container .s-lg-tabs-side').remove();$('#s-lg-guide-header-info2').remove();$('#mobile-breadcrumbs').remove();$('#s-lg-guide-header-search').remove();$('#s-lg-col-2').remove();$('#s-lg-guide-tabs.col-md-3 s-lg-tabs-side pad-bottom-med').remove();$('.nav nav-pills nav-stacked').remove();$('footer.gc-02-footer').remove();$('main.institute-detail').css('padding-top','20px');$('html, body').animate({ scrollTop: 0 });})")
        }

    func webViewDidFinishLoad(_ webView: UIWebView) {

        loadSpinner.stopAnimating()
        loadSpinner.hidesWhenStopped = true
        hidebacbutton()
       
    }
}
