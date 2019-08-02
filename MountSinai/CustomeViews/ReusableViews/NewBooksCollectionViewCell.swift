//
//  NewBooksCollectionViewCell.swift
//  MountSinai
//
//  Created by Mobikasa on 15/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class NewBooksCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "NewBooksCollectionViewCell"
    @IBOutlet weak var booksImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var bookNameLabel: UILabel!
    
    @IBOutlet weak var writerNameLabel: UILabel!
    weak var delegate:  UIViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        borderColor()
    }
    
    func borderColor(){
        
//        self.containerView.layer.cornerRadius = 7
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
