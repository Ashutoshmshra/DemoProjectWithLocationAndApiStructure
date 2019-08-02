//
//  NewBookViewController.swift
//  MountSinai
//
//  Created by Mobikasa on 16/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class NewBookViewController: BaseViewController {
    var newBookArrayData = [[String: Any]]()
    var newBookpageindex: Int!
    var homeLatestNewsModel: HomeBookClass?
    @IBOutlet weak var newbBooksCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarWithRight()
        newbBooksCollectionView.delegate=self
        newbBooksCollectionView.dataSource=self
        newbBooksCollectionView?.register(UINib.init(nibName: NewBooksCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: NewBooksCollectionViewCell.cellIdentifier)
        newBookpageindex = 1
//        callGetBookPageDataApi(pageIndex:  newBookpageindex)
        callLatestNewsApi()
    }
    
    
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
//                        var homeBookData = HomeBookClass(object: data)
//
//
////                        self?.recrodPagedata = homeBookData?.recordsPerPage
////                        self?.recordShowData = homeBookData?.recordsShowing
////                        self?.messageData = homeBookData?.message
////                        self?.statusData = homeBookData?.status
//
//                        let datatest = data["list_array"] as! [[String:Any]]
//                        self?.newBookArrayData.append(contentsOf: datatest)
//                        var setData = datatest[0]
////                        if let title = setData["title"], let href = setData["href"], let author = setData["author"], let image = setData["image"] {
////                            homeBookData?.listArray?[0].title = title as? String
////                            homeBookData?.listArray?[0].href = href as? URL
////                            homeBookData?.listArray?[0].author = author as? String
////                            homeBookData?.listArray?[0].image = image as? String
////                        }
//                        if let jsonData =   homeBookData?.toData(){
//                            AppConstants.SaveUserDefaults(value: jsonData, key: AppConstants.USERDETAILS)
//
//                        }
//                        self!.newbBooksCollectionView.reloadData()
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

}
// MARK:- UICollectionView delegate and DataSource

extension NewBookViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.homeLatestNewsModel?.data?.blogs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: NewBooksCollectionViewCell.cellIdentifier, for: indexPath) as! NewBooksCollectionViewCell
        cell.bookNameLabel.text = self.homeLatestNewsModel?.data?.blogs?[indexPath.row].title
                cell.booksImageView.sd_setImage(with: URL(string: (self.homeLatestNewsModel?.data?.blogs?[indexPath.row].img_src)!), placeholderImage: UIImage())
        cell.writerNameLabel.text = self.homeLatestNewsModel?.data?.blogs?[indexPath.row].author
        
        return cell
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ShowBookInWebViewController") as! ShowBookInWebViewController
        //            controller.urlString =  (dictdata["href"] as! String)
        controller.urlString = (self.homeLatestNewsModel?.data?.blogs?[indexPath.row].href ) ?? ""
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size: CGFloat = 190
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S: size = 190
        default: size = 207
            
        }
        return CGSize(width: self.newbBooksCollectionView.frame.width/3 - 4, height: size)
    }
}
extension NewBookViewController {
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
                        if let title = self?.homeLatestNewsModel?.data?.blogs?[0].title, let href = self?.homeLatestNewsModel?.data?.blogs?[0].href, let author = self?.homeLatestNewsModel?.data?.blogs?[0].author, let img_src = self?.homeLatestNewsModel?.data?.blogs?[0].img_src{
                            self?.homeLatestNewsModel?.data?.blogs?[0].title = title as? String
                            self?.homeLatestNewsModel?.data?.blogs?[0].href = href as? String
                            self?.homeLatestNewsModel?.data?.blogs?[0].img_src = img_src as? String
                            self?.homeLatestNewsModel?.data?.blogs?[0].author = author as? String
                        }
                        if let jsonData =   self?.homeLatestNewsModel?.toData(){
                            AppConstants.SaveUserDefaults(value: jsonData, key: AppConstants.USERDETAILS)
                            
                        }
                        self!.newbBooksCollectionView.reloadData()
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
