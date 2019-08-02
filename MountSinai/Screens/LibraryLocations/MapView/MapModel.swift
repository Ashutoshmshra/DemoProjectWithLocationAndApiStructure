//
//  MapModel.swift
//  MountSinai
//
//  Created by Praveen on 11/12/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
import UIKit

struct MapModelData: Hashable, Equatable {
    
    var title: String?
    var subtitle: String?
    var timing: String
    var subViewBackColor: UIColor?

    init(title:String,subtitle:String,timing:String,subViewBackColor:UIColor) {
    self.title = title
    self.subtitle = title
    self.timing = timing
    self.subViewBackColor = subViewBackColor
}
    var hashValue: Int {
        return title.hashValue
    }
    
    static func ==(lhs: MapModelData, rhs: MapModelData) -> Bool {
        return lhs.title == rhs.title
    }
}
