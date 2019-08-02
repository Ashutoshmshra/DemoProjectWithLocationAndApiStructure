//
//  CustomTabBar.swift
//
//  Created by Praveen on 02/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
import UIKit
class CustomTabBar : UITabBar {
    @IBInspectable var height: CGFloat = 0.0
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        if height > 0.0 {
            sizeThatFits.height = height
        }
        return sizeThatFits
    }
}

