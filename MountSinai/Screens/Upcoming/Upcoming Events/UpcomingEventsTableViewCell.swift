//
//  UpcomingEventsTableViewCell.swift
//  MountSinai
//
//  Created by Mobikasa on 16/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class UpcomingEventsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var calenderButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var noEventsLabel: UILabel!
    @IBOutlet weak var newDateLabel: UILabel!
    @IBOutlet weak var newMonthLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitlelabel: UILabel!
    override func awakeFromNib() {
       super.awakeFromNib()
////        calenderButton.layer.masksToBounds =  false
////        calenderButton.layer.cornerRadius = 13.0
////        calenderButton.layer.borderWidth = 0.01
////        calenderButton.layer.borderColor = UIColor.lightGray.cgColor
////        calenderButton.layer.shadowRadius = 13.0
////        calenderButton.layer.clipTo
        titleLabel.sizeToFit()
//        calenderButton.setImage("", for: .normal).sizetoFit
   }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
