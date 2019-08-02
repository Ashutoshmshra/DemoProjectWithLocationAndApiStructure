//
//  SplashScreenViewController.swift
//  MountSinai
//
//  Created by Praveen on 14/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class SplashScreenViewController: BaseViewController {
    @IBOutlet weak var splashCollectionView: UICollectionView!
    var arrCellData = ["Good\nReads", "Catalog\nSearch", "Chat", "Hours&\nLocation", "Events", "Blog"]
    var arrImageData = ["NewBook", "NewSearch", "NewChat", "NewLocation", "NewCalender", "NewBlog"]
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setnavigationWithoutBack()
        setNavigationBarWithRight()
        splashCollectionView?.register(UINib.init(nibName: UpdateSplashCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: UpdateSplashCollectionViewCell.cellIdentifier)
        
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
    
}
// MARK:- UICollectionView Delegate and dataSource

extension SplashScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: UpdateSplashCollectionViewCell.cellIdentifier, for: indexPath) as! UpdateSplashCollectionViewCell
       cell.cellTitleLabel.text = arrCellData[indexPath.row]
        cell.cellImageLabel.image = UIImage(named: arrImageData[indexPath.row])
        cell.cellTitleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
       cell.supportView.layer.masksToBounds =  false
        cell.supportView.layer.cornerRadius = 7.0
        cell.supportView.layer.shadowColor = UIColor.darkGray.cgColor;
        cell.supportView.layer.shadowOffset = CGSize(width: 3, height: 5)
        cell.supportView.layer.shadowOpacity = 0.2
        cell.supportView.layer.shadowRadius = 7.0
        let index = indexPath.row % 3
        if index == 0 {
            cell.supportView.backgroundColor = UIColor(red: 34/255, green: 31/255, blue: 114/255, alpha: 1)
        }
        else if index == 1 {
            cell.supportView.backgroundColor = UIColor(red: 0/255, green: 174/255, blue: 239/255, alpha: 1)
        }
        else {
            cell.supportView.backgroundColor = UIColor(red: 216/255, green: 11/255, blue: 140/255, alpha: 1)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "TabViewController")
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
        
    }
        else if indexPath.row == 1{
            let vc = UIStoryboard.init(name: "Main", bundle:Bundle.main).instantiateViewController(withIdentifier: "TabViewController") as! TabViewController
            self.navigationController?.pushViewController(vc, animated: true)
            // when you want to open first index
//            vc.selectedIndex = 0
            // when you want to open second index
            vc.selectedIndex = 1

        }
        else if indexPath.row == 2{
            let vc = UIStoryboard.init(name: "Main", bundle:Bundle.main).instantiateViewController(withIdentifier: "TabViewController") as! TabViewController
            self.navigationController?.pushViewController(vc, animated: true)
//             openBlogsPage(openSocialSiteHandle: "https://libguides.mssm.edu/blog")
           vc.selectedIndex = 2
        }
        else if indexPath.row == 3{
            let vc = UIStoryboard.init(name: "Main", bundle:Bundle.main).instantiateViewController(withIdentifier: "TabViewController") as! TabViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.selectedIndex = 3
        }
        else if indexPath.row == 4{
            let vc = UIStoryboard.init(name: "Main", bundle:Bundle.main).instantiateViewController(withIdentifier: "TabViewController") as! TabViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.selectedIndex = 4
        }
        else if indexPath.row == 5{
//            openBlogsPage(openSocialSiteHandle: "https://libguides.mssm.edu/blog")
           let vc = UIStoryboard.init(name: "Main", bundle:Bundle.main).instantiateViewController(withIdentifier: "ShowBookInWebViewController") as! ShowBookInWebViewController
            vc.urlString = "https://libguides.mssm.edu/blog"
            
           self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let appDelegate = UIApplication.shared.delegate! as! AppDelegate
            let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "TabViewController")
            appDelegate.window?.rootViewController = initialViewController
            appDelegate.window?.makeKeyAndVisible()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size: CGFloat = 130
        switch UIDevice().type {
        case .iPhoneSE,.iPhone5,.iPhone5S: size = 150
        default: size = 175
        }
       return CGSize(width: self.splashCollectionView.frame.width/2 - 8, height: size)
    }
    
}
