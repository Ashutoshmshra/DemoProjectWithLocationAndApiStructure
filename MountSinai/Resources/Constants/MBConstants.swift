//
//  MBConstants.swift
//
//  Created by Mobikasa_Umesh on 20/10/17.
//  Copyright © 2017 Mobikasa. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    //App Level
    static let TextColor_Gray_74    = UIColor.init(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
    static let TextColor_Gray_228   = UIColor.init(red: 228.0/255.0, green: 228.0/255.0, blue: 228.0/255.0, alpha: 1.0)
    static let TextColor_Gray_155   = UIColor.init(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
    static let TextColor_Blue       = UIColor.init(red: 39.0/255.0, green: 143.0/255.0, blue: 175.0/255.0, alpha: 1.0)
    static let TextColor_Red        = UIColor.init(red: 217.0/255.0, green: 34.0/255.0, blue: 49.0/255.0, alpha: 1.0)
    
    static let BackgroundColor_White      = UIColor.white
    static let BackgroundColor_Clear      = UIColor.clear
    
    static let WhiteColor                 = UIColor.white
    
    static let StatusColor_Unpurchased        = UIColor.clear
    static let StatusColor_Requested        = UIColor.init(red: 246.0/255.0, green: 188.0/255.0, blue: 65.0/255.0, alpha: 1.0)
    static let StatusColor_Approved        = UIColor.red
    static let StatusColor_Purchased        = UIColor.green
    
    //Left Menu
    static let LeftMenuCellBackgroundColor_Select_Light = UIColor.init(red: 39.0/255.0, green: 143.0/255.0, blue: 175.0/255.0, alpha: 0.38)
    static let LeftMenuCellBackgroundColor_Select_Dark = UIColor.init(red: 39.0/255.0, green: 143.0/255.0, blue: 175.0/255.0, alpha: 1.0)
    static let LeftMenuCellBackgroundColor_Unselect = UIColor.white
    
    //counter Label Color : Left Menu
    static let LeftMenuCounterLabelBackgroundColor_Unselected = UIColor.init(red: 217.0/255.0, green: 34.0/255.0, blue: 49.0/255.0, alpha: 1.0)
    static let LeftMenuCounterLabelTextColor_Unselected = UIColor.white
    static let LeftMenuCounterLabelBackgroundColor_Selected = UIColor.white
    static let LeftMenuCounterLabelTextColor_Selected = TextColor_Gray_74
    
    
}

struct AppDimensions {
    static let screenWidth = Int(UIScreen.main.bounds.size.width)
    static let screenHeight = Int(UIScreen.main.bounds.size.height)
    static let navBarHeight = 74
    static let navBarFrame = CGRect.init(x: 0, y: 0, width: AppDimensions.screenWidth, height: AppDimensions.navBarHeight)
    
    static let mainViewCellConstantHeight: CGFloat = CGFloat(14 + 5 + 16 + 8 + 15 + 36 + 15)
    static let mainViewCellCollapsedHeight: CGFloat = CGFloat(44)
    static let distanceFromTheKeyboard: CGFloat =  CGFloat(130)
    static let buttonWidthConstant = CGFloat(0.396269)
    static let singleButtonWidth = AppDimensions.screenWidth - 54
}

struct App_Delegate {
    static let appDelegateObj = UIApplication.shared.delegate as! AppDelegate
}

struct AppFonts {
    static let serviceTitleFont_Expanded = UIFont.systemFont(ofSize: 16.0)
    static let serviceTitleFont_Collapsed = UIFont.systemFont(ofSize: 14.0)
    static let systemFont_14 = UIFont.systemFont(ofSize: 14.0)
    
    static let serviceDesciptionFont_Expanded = UIFont.systemFont(ofSize: 13.0)
}

struct ImageName {
    static let DropDownImageIcon_Expanded = "ic_arrow_drop_up_black_24px"
    static let DropDownImageIcon_Collapsed = "ic_arrow_drop_down_black_24px"
    static let VISAImageIcon                = "Visa-icon"
}

struct UserDefaultKeys {
    static let IsUserLoggedIn = "isUserLoggedIn"
    static let IsSubscriptionPurchased = "isSubscriptionPurchased"
    static let Token = "token"
    static let UserInformation = "userInformation"
    static let PhoneNumber = "phone"
    static let promoCode = "codes"
    static let Password = "password"
}

struct AppConstant {
    static let AccessTokenKey = "Authorization"
    static let Appversion = "1.0"
    static let WebURl = "https://www.mountsinai.com/"
}
