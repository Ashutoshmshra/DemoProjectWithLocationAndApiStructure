//
//  HomeViewController.swift
//  MountSinai
//
//  Created by Mobikasa on 15/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: BaseViewController {
    
    var homeDataModel: HomeDataClass?
    var homeLatestNewsModel: HomeBookClass?
   var topicArrData = SpecialData()
    var arrData = [ResponseDetailsModel]()
    var arrNewsData = [ResponseNewsModel]()
    var bookDataModel: HomeBookClass?
    var aryData = [[String:Any]]()
     var aryData1 = [[String:Any]]()
    var recrodPagedata:Int!
    var recordShowData: Int!
    var messageData: String!
    var statusData:Int!
    var pageindex: Int!
    var pageindex1: Int!
    
    @IBOutlet weak var newBooksViewAllButton: UIButton!
    @IBOutlet weak var categoryViewAllButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var booksCollectionView: UICollectionView!
    @IBOutlet weak var booksView: UIView!
    @IBOutlet weak var exploreCategoriesView: UIView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.delegate=self
        homeCollectionView.dataSource=self
        booksCollectionView?.register(UINib.init(nibName:NewBooksCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: NewBooksCollectionViewCell.cellIdentifier)
        homeCollectionView?.register(UINib.init(nibName: "SplashCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SplashCollectionViewCell")
//        connectButton.layer.cornerRadius = 20.0
//        setnavigationWithoutBack()
        setNavigationBarWithRight()
        pageindex = 1
        pageindex1 = 1
//        callGetPageDataApi(pageIndex:  pageindex)
        callSpecialTopicAPIApi()
        callLatestNewsApi()
//        callGetBookPageDataApi(pageIndex: pageindex1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
    
    
    
     //Mark:- navigate to  CategoriesViewController
    
    @IBAction func actionCategoriesViewAllButton(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle:Bundle.main).instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionNewBookViewAllButton(_ sender: UIButton) {
        if let rootView = self.tabBarController,
            let tabVCs = rootView.viewControllers,
            tabVCs.count > 1,
            let homeNav:UINavigationController = tabVCs[2] as? UINavigationController,
            let homeVC = homeNav.viewControllers.first as? NewBookViewController{
//            homeNav.popToRootViewController(animated: true)
            rootView.selectedIndex = 2//------ to select appointment screen
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
             //   homeVC.actionUpcommingButton(BlueWhiteButton()) //------ open upcoming Appointment job
                homeVC.callLatestNewsApi()
            }
            
        }
    }
    
    
    
    @IBAction func actionFacebookButton(_ sender: UIButton) {
        openSocialSitePage(openSocialSiteHandle: "https://www.facebook.com/Levy.Library/")
    }
    
    @IBAction func actionTwitterButton(_ sender: UIButton) {
       openSocialSitePage(openSocialSiteHandle: "https://twitter.com/@Levy_Library")
    }
    //MARK:- Youtube Button Action
    
    @IBAction func actionInstaButton(_ sender: Any) {
        openSocialSitePage(openSocialSiteHandle: "https://www.youtube.com/channel/UCajDQZEzWE8OlDhVzJbu20g")
    }
     //MARK:- Insta Button Action
    
    @IBAction func actionYoutubeButton(_ sender: UIButton) {
        openSocialSitePage(openSocialSiteHandle: "https://www.instagram.com/levy_library/")
    }
    
    @IBAction func actionSnapchatButton(_ sender: UIButton) {
        openSocialSitePage(openSocialSiteHandle: "https://www.snapchat.com/add/levy_library")
    }
    
    
    @IBAction func actionBlogButton(_ sender: UIButton) {
        //by Manoj:- 7th januray as per email by umesh sir
        //openSocialSitePage(openSocialSiteHandle: "https://libguides.mssm.edu/blog")
        self.tabBarController?.selectedIndex = 2
    }
    
    
    
    
    
}

// MARK:- Network Classes

extension HomeViewController {
    
//    func callGetPageDataApi(pageIndex:Int) {
//        if !NetworkManager.isConnectedToInternet() {
//            weak var weakSelf = self
//            // Show Alert ---
//            alertForInternet()
//            print("Please check your internet connection!")
//            weakSelf?.callGetPageDataApi(pageIndex: pageIndex)
//            return
//        }
//
//        MKServiceManager.getHomeData(pageURLIndex: pageIndex) { [weak self](response, stutus, error, statusCode) -> (Void) in
//            if statusCode == 200 {
//                if let response = response {
//                    let message = response["message"] as? String
//                    if let data = response ["data"] as? [String:Any] {
//                        self?.homeDataModel = HomeDataClass(object: data)
////                        self?.homeModelData = homeData
//                        self?.recrodPagedata = self?.homeDataModel?.recordsPerPage
//                        self?.recordShowData = self?.homeDataModel?.recordsShowing
//                        self?.messageData = self?.homeDataModel?.message
//                        self?.statusData = self?.homeDataModel?.status
//                        if let title = self?.homeDataModel?.listArray?[0].title, let href = self?.homeDataModel?.listArray?[0].href{
//                            self?.homeDataModel?.listArray?[0].title = title as? String
//                            self?.homeDataModel?.listArray?[0].href = href as? URL
//                        }
//                        if let jsonData =   self?.homeDataModel?.toData(){
//                            AppConstants.SaveUserDefaults(value: jsonData, key: AppConstants.USERDETAILS)
//
//                        }
//                        self!.homeCollectionView.reloadData()
//                    }
//                }
//            }
//            else{
//                if let response = response{
//                    if let message = response["message"]
//                    {
//                        //self.alertFunction(message: message as! String)
//                    }
//                }
//            }
//        }
//    }
//
    // MARK:- Books Collection API
    
//    func callGetBookPageDataApi(pageIndex:Int) {
//        if !NetworkManager.isConnectedToInternet() {
//            weak var weakSelf = self
//            // Show Alert ---
//            alertForInternet()
//            print("Please check your internet connection!")
//            weakSelf?.callGetBookPageDataApi(pageIndex: pageIndex)
//            return
//        }
//
//        MKServiceManager.getHomeBookData(pageURLIndex: pageIndex) { [weak self](response, stutus, error, statusCode) -> (Void) in
//            if statusCode == 200 {
//                if let response = response {
//                    let message = response["message"] as? String
//                    if let data = response ["data"] as? [String:Any] {
//                        self?.bookDataModel = HomeBookClass(object: data)
//
//                        self?.recrodPagedata = self?.bookDataModel?.recordsPerPage
//                        self?.recordShowData = self?.bookDataModel?.recordsShowing
//                        self?.messageData = self?.bookDataModel?.message
//                        self?.statusData = self?.bookDataModel?.status
//
//                        let datatest = data["list_array"] as! [[String:Any]]
//                        self?.aryData1.append(contentsOf: datatest)
//                        var setData = datatest[0]
//                        if let title = setData["title"], let href = setData["href"], let author = setData["author"], let image = setData["image"] {
//                            self?.bookDataModel?.listArray?[0].title = title as? String
//                            self?.bookDataModel?.listArray?[0].href = href as? URL
//                            self?.bookDataModel?.listArray?[0].author = author as? String
//                            self?.bookDataModel?.listArray?[0].image = image as? String
//                        }
//                        if let jsonData =   self?.bookDataModel?.toData(){
//                            AppConstants.SaveUserDefaults(value: jsonData, key: AppConstants.USERDETAILS)
//
//                        }
//                        self!.booksCollectionView.reloadData()
//                    }
//                }
//            }
//            else{
//                if let response = response{
//                    if let message = response["message"]
//                    {
//                        //self.alertFunction(message: message as! String)
//                    }
//                }
//            }
//        }
//    }
    
    func callSpecialTopicAPIApi() {
        if !NetworkManager.isConnectedToInternet() {
            weak var weakSelf = self
            // Show Alert ---
            alertForInternet()
            print("Please check your internet connection!")
            weakSelf?.callSpecialTopicAPIApi()
            return
        }
        
        MKServiceManager.getSpecialTopicData { [weak self](response, stutus, error, statusCode) -> (Void) in
            if statusCode == 200 {
                if let response = response {
                    let message = response["message"] as? String
                    if let data = response ["data"] as? [String:Any] {
                        self?.homeDataModel = HomeDataClass(object: response)
//                        self?.messageData = self?.homeDataModel?.message
//                        self?.statusData = self?.homeDataModel?.status
                        if let title = self?.homeDataModel?.data?.specialtopics?[0].title, let href = self?.homeDataModel?.data?.specialtopics?[0].href{
                            self?.homeDataModel?.data?.specialtopics?[0].title = title as? String
                            self?.homeDataModel?.data?.specialtopics?[0].href = href as? URL
                        }
                        if let jsonData =   self?.homeDataModel?.toData(){
                            AppConstants.SaveUserDefaults(value: jsonData, key: AppConstants.USERDETAILS)
                            
                        }
                        self!.homeCollectionView.reloadData()
                    }
                }
            }
            else{
                if let response = response{
                    if let message = response["message"]
                    {
                        //self.alertFunction(message: message as! String)
                    }
                }
            }
            

            
            
        }
        
    }
    
    
    func callLatestNewsApi() {
        if !NetworkManager.isConnectedToInternet() {
            weak var weakSelf = self
            // Show Alert ---
            alertForInternet()
            print("Please check your internet connection!")
            weakSelf?.callLatestNewsApi()
            return
        }
        
        MKServiceManager.getLatestNewsData { [weak self](response, stutus, error, statusCode) -> (Void) in
            if statusCode == 200 {
                if let response = response {
                    let message = response["message"] as? String
                    if let data = response ["data"] as? [String:Any] {
                        self?.homeLatestNewsModel = HomeBookClass(object: response)
                        //                        self?.messageData = self?.homeDataModel?.message
                        //                        self?.statusData = self?.homeDataModel?.status
                        if let title = self?.homeLatestNewsModel?.data?.blogs?[0].title, let href = self?.homeLatestNewsModel?.data?.blogs?[0].href{
                            self?.homeLatestNewsModel?.data?.blogs?[0].title = title as? String
                            self?.homeLatestNewsModel?.data?.blogs?[0].href = href as? String
                        }
                        if let jsonData =   self?.homeLatestNewsModel?.toData(){
                            AppConstants.SaveUserDefaults(value: jsonData, key: AppConstants.USERDETAILS)
                            
                        }
                        self!.booksCollectionView.reloadData()
                    }
                }
            }
            else{
                if let response = response{
                    if let message = response["message"]
                    {
                        //self.alertFunction(message: message as! String)
                    }
                }
            }
            
            
            
            
        }
        
    }
    

    
    
}

// MARK:- UICollectionView delegate and DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeCollectionView {
           return  self.homeDataModel?.data?.specialtopics?.count ?? 0
//            return 10
        }
        else {
         return self.homeLatestNewsModel?.data?.blogs?.count ?? 0
//            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == homeCollectionView) {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SplashCollectionViewCell", for: indexPath) as! SplashCollectionViewCell
            cell.cellTitleLabel.text = self.homeDataModel?.data?.specialtopics?[indexPath.row].title
//            cell.backgroundColor = UIColor.red
            return cell
        }else  {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: NewBooksCollectionViewCell.cellIdentifier, for: indexPath) as! NewBooksCollectionViewCell
            cell.bookNameLabel.text = self.homeLatestNewsModel?.data?.blogs?[indexPath.row].title
           cell.booksImageView.sd_setImage(with: URL(string: (self.homeLatestNewsModel?.data?.blogs?[indexPath.row].img_src)!), placeholderImage: UIImage())
            cell.writerNameLabel.text = self.homeLatestNewsModel?.data?.blogs?[indexPath.row].author
            
            return cell
        }
        
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            if collectionView == homeCollectionView {
            return 12
            }
            else {
               return 12
            }
        
        }
//     minimumLineSpacing
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            if collectionView == homeCollectionView {
                return 12
            }
            else {
                return 12
            }
        }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == homeCollectionView {
//            if statusData == 1 {
//        let dictdata = aryData[indexPath.row]
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ShowBookInWebViewController") as! ShowBookInWebViewController
//        controller.urlString =  (dictdata["href"] as! String)
            controller.urlString = ((self.homeDataModel?.data?.specialtopics?[indexPath.row].href)?.absoluteString)!
        self.navigationController?.pushViewController(controller, animated: true)
        }
        else {
//            let dictdata = aryData1[indexPath.row]
            
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "ShowBookInWebViewController") as! ShowBookInWebViewController
            //            controller.urlString =  (dictdata["href"] as! String)
            controller.urlString = (self.homeLatestNewsModel?.data?.blogs?[indexPath.row].href ) ?? ""
            self.navigationController?.pushViewController(controller, animated: true)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == homeCollectionView {
            return CGSize(width: 183, height: 73)
        }
        else {
            var size: CGFloat = 200
            switch UIDevice().type {
            case .iPhoneSE,.iPhone5,.iPhone5S: size = 190
            default: size = 207   }
            return CGSize(width: 120, height: size)
        }
        
    }
    
}
