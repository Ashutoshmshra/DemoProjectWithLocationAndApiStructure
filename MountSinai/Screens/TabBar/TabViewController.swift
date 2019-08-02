//
//  TabViewController.swift
//  MountSinai
//
//  Created by Praveen on 15/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController , UITabBarControllerDelegate{
    
    @IBOutlet weak var myTabBar: UITabBar!
    
    //last selected index
    var previousIndex = Int()
    var  priorIndex  = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        myTabBar?.tintColor = UIColor.clear
    
        
        setTabBarItems()
        self.delegate = self
        let index = tabBarController?.selectedIndex
        print(" index is \(String(describing: index))")
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 216/255, green: 11/255, blue: 140/255, alpha: 1)], for: .selected)
  
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.tabBar.backgroundImage = UIImage(named: "")
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = UIColor.white
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.darkGray.cgColor
        tabBar.layer.shadowOpacity = 0.63
//        let application = UIApplication.shared.delegate as! AppDelegate
//        let tabbarController = application.window?.rootViewController as! UITabBarController
        self.previousIndex = self.tabBarController?.selectedIndex ??  0
        print("Selected Index is \(previousIndex)")
//        self.previousIndex = tabBarController!.selectedIndex
        
    }
    // MARK:- tabBar Selcted and Unselected image
    
    
    func setTabBarItems(){
        
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: "home_inactive")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.selectedImage = UIImage(named: "home_active")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem1.title = "Good Reads"
   //     myTabBarItem1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: "catelog")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.selectedImage = UIImage(named: "catelog_active")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem2.title = "Catelog"
//        myTabBarItem2.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        
        let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
        myTabBarItem3.image = UIImage(named: "news")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem3.selectedImage = UIImage(named: "news_active")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem3.title = "Latest News"
      //  myTabBarItem3.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let myTabBarItem4 = (self.tabBar.items?[3])! as UITabBarItem
        myTabBarItem4.image = UIImage(named: "location copy")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem4.selectedImage = UIImage(named: "loaction-active-2")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem4.title = "Location"
     //   myTabBarItem4.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let myTabBarItem5 = (self.tabBar.items?[4])! as UITabBarItem
        myTabBarItem5.image = UIImage(named: "event")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem5.selectedImage = UIImage(named: "event_active")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem5.title = "Events"
     //   myTabBarItem5.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
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
    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        var selectIndex = tabBarController.selectedIndex
//       self.priorIndex =  tabBarController.selectedIndex
////        let index = tabBarItem
//        
//        if selectIndex == 2 {
//            //do your stuff
//            print ("Tab 2 is selected ?")
//            tabBarController.selectedIndex = 0
//
//            openBlogsPage(openSocialSiteHandle: "https://libguides.mssm.edu/blog")
////            /tabBarController.selectedIndex = previousIndex
////            selectIndex = 0
//
//        }
////        let selectedIndex = tabBarController.viewControllers!.index(of: viewController)!
////        if selectedIndex == 2 {
////            // do something
////            openBlogsPage(openSocialSiteHandle: "https://libguides.mssm.edu/blog")
////        }
//
//}
}
