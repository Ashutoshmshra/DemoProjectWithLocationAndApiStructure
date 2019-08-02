//
//  CategoriesViewController.swift
//  MountSinai
//
//  Created by Praveen on 16/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class CategoriesViewController: BaseViewController {
    
    var categoriesArrayData = [[String: Any]]()
    
    var categoriesModelData: HomeDataClass?
    var homeDataModel: HomeDataClass?
    
    var categorypageindex: Int!
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        categoriesCollectionView?.register(UINib.init(nibName: SplashCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: SplashCollectionViewCell.cellIdentifier)
        categorypageindex = 1
//        callGetPageDataApi(pageIndex:  categorypageindex)
        callSpecialTopicAPIApi()
    }
}
// MARK:- UICollectionView Delegate and DataSource
extension CategoriesViewController: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row >= 49*categorypageindex {
//            //           pageindex =  pageindex + 1
//            callGetPageDataApi(pageIndex:  categorypageindex)
//            print("page index is:--\(categorypageindex ?? 0)")
//            print("To find index position :- \(indexPath.row)" )
//            categorypageindex =  categorypageindex + 1
//        }
//        //        pageindex =  pageindex + 1
//    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.homeDataModel?.data?.specialtopics?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SplashCollectionViewCell.cellIdentifier, for: indexPath) as! SplashCollectionViewCell
//        let categoryData = categoriesArrayData[indexPath.row]
//        cell.cellTitleLabel.text = (categoryData["title"] as! String)
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SplashCollectionViewCell", for: indexPath) as! SplashCollectionViewCell
        cell.cellTitleLabel.text = self.homeDataModel?.data?.specialtopics?[indexPath.row].title
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let categoryData = categoriesArrayData[indexPath.row]
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ShowBookInWebViewController") as! ShowBookInWebViewController
//        vc.urlString = (categoryData["href"] as! String)
//        self.navigationController?.pushViewController(vc, animated: true)
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ShowBookInWebViewController") as! ShowBookInWebViewController
        //        controller.urlString =  (dictdata["href"] as! String)
        controller.urlString = ((self.homeDataModel?.data?.specialtopics?[indexPath.row].href)?.absoluteString)!
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size: CGFloat = 329
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S:size = 294
            
        default:size = 330
            
        }
        return CGSize(width: size, height: 80)
    }
    
}
extension CategoriesViewController {
    
    func callGetPageDataApi(pageIndex:Int) {
        if !NetworkManager.isConnectedToInternet() {
            weak var weakSelf = self
            // Show Alert ---
            alertForInternet()
            print("Please check your internet connection!")
            weakSelf?.callGetPageDataApi(pageIndex: pageIndex)
            return
        }
        //        if  recrodPagedata == 50 {
        //        pageIndex = pageIndex + 1
        //        }
        MKServiceManager.getHomeData(pageURLIndex: pageIndex) { [weak self](response, stutus, error, statusCode) -> (Void) in
            if statusCode == 200 {
                if let response = response {
                    let message = response["message"] as? String
                    if let data = response ["data"] as? [String:Any] {
                        self?.categoriesModelData = HomeDataClass(object: data)
                        //                        self?.homeModelData = homeData
//                        self?.recrodPagedata = homeData?.recordsPerPage
//                        self?.recordShowData = homeData?.recordsShowing
//                        self?.messageData = homeData?.message
//                        self?.statusData = homeData?.status
                        
                        let datatest = data["list_array"] as! [[String:Any]]
                        self?.categoriesArrayData.append(contentsOf: datatest)
                        var setData = datatest[0]
//                        if let title = setData["title"], let href = setData["href"] {
//                            self?.categoriesModelData?.listArray?[0].title = title as? String
//                            self?.categoriesModelData?.listArray?[0].href = href as? URL
//                        }
                        if let jsonData =   self?.categoriesModelData?.toData(){
                            AppConstants.SaveUserDefaults(value: jsonData, key: AppConstants.USERDETAILS)
                            
                        }
                        self!.categoriesCollectionView.reloadData()
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
                        self!.categoriesCollectionView.reloadData()
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
