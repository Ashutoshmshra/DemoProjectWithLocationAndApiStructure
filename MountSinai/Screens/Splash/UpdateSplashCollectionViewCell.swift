//
//  UpdateSplashCollectionViewCell.swift
//  MountSinai
//
//  Created by Praveen on 08/12/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class UpdateSplashCollectionViewCell: UICollectionViewCell {
     static let cellIdentifier  = "UpdateSplashCollectionViewCell"
     weak var delegate:  UIViewController?
    @IBOutlet weak var supportView: UIView!
    @IBOutlet weak var cellImageLabel: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
