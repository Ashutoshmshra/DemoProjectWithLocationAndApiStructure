//
//  NavigationViewClass.swift
//  MountSinai
//
//  Created by Praveen on 05/12/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
import UIKit

class NavigationView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds =  false
        self.layer.cornerRadius = 0.0
        self.layer.shadowColor = UIColor.darkGray.cgColor;
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 5.0
        
    }
}
