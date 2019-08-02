//
//  CustomButtonClass.swift
//  MountSinai
//
//  Created by Mobikasa on 16/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class CustomButtonClass: UIView {
    override func awakeFromNib() {
    super.awakeFromNib()
    self.layer.masksToBounds =  false
    self.layer.cornerRadius = 5.0
    self.layer.shadowColor = UIColor.darkGray.cgColor;
    self.layer.shadowOffset = CGSize(width: 0, height: 3)
    self.layer.shadowOpacity = 0.2
    self.layer.shadowRadius = 5.0
//    self.clipsToBounds = true
}
}
