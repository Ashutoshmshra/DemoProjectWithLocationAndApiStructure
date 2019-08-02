//
//  SplashCollectionViewCell.swift
//  MountSinai
//
//  Created by Praveen on 14/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class SplashCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelWidthConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var labelHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var supportView: UIView!
    
    @IBOutlet weak var labelWidthCnstrnt: NSLayoutConstraint!
    
    @IBOutlet weak var labelHeightCnstrnt: NSLayoutConstraint!
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    static let cellIdentifier = "SplashCollectionViewCell"
    weak var delegate:  UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        supportView.layer.masksToBounds =  false
        supportView.layer.cornerRadius = 5.0
        supportView.layer.shadowColor = UIColor.darkGray.cgColor;
        supportView.layer.shadowOffset = CGSize(width: 2, height: 3)
        supportView.layer.shadowOpacity = 0.3
        supportView.layer.shadowRadius = 5.0
        supportView.clipsToBounds = true
        
    }
    
}
