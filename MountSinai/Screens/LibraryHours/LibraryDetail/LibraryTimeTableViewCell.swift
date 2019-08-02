//
//  LibraryTimeTableViewCell.swift
//  MountSinai
//
//  Created by Praveen on 16/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class LibraryTimeTableViewCell: UITableViewCell {
    static let cellIdentifier = "LibraryTimeTableViewCell"
    weak var delegate:  UIViewController?
    
    @IBOutlet weak var sideSubView: UIView!
    @IBOutlet weak var tiltleAddressLabel: UILabel!
    
    @IBOutlet weak var subtitleAddressLabel: UILabel!
    @IBOutlet weak var timingLabel: UILabel!
    @IBOutlet weak var rightArrowButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func displayData(mapData obj: MapModelData) {
        tiltleAddressLabel.text = obj.title
        subtitleAddressLabel.text = obj.subtitle
        timingLabel.text = obj.timing
        sideSubView.backgroundColor = obj.subViewBackColor
    }
    
    
    @IBAction func actionRightArrowButton(_ sender: UIButton) {
    }
    
}
