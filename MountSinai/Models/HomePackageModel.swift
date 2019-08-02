//
//  HomePackageModel.swift
//  MountSinai
//
//  Created by Praveen on 22/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
import UIKit

struct HomeDataClass:MKJSONModel{
    var status:Bool?
    var message:String?
    var data:SpecialData?
    
}

struct SpecialData:MKJSONModel{
    var specialtopics:[ResponseDetailsModel]?
}

struct  ResponseDetailsModel: MKJSONModel {
    var title: String?
    var href: URL?
}






