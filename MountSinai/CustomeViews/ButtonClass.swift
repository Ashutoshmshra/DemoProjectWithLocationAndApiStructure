//
//  ButtonClass.swift
//  MountSinai
//
//  Created by Praveen on 10/12/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class ButtonClass: UIButton {
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
