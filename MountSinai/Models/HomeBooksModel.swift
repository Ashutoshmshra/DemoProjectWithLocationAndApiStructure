//
//  HomeBooksModel.swift
//  MountSinai
//
//  Created by Praveen on 06/12/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//
//
//import Foundation
//
//import UIKit
//struct HomeBookClass: MKJSONModel {
//    var status: Int?
//    var message: String?
//    var recordsPerPage, recordsShowing: Int?
//    var listArray: [ResponseBookDetailsModel]?
//}
//struct  ResponseBookDetailsModel: MKJSONModel {
//
//    var title: String?
//    var href: URL?
//    var image: String?
//    var author: String?
//    var publisher: String?
//    var ebook: String?
//    var language: String?
//
//}


import Foundation
import UIKit

struct HomeBookClass: MKJSONModel{
    var status:Bool?
    var message:String?
    var data:LatestNewsData?
    
}

struct LatestNewsData: MKJSONModel{
    var blogs:[ResponseNewsModel]?
}

struct  ResponseNewsModel: MKJSONModel {
    var title: String?
    var href: String?
    var img_src: String?
    var date: String?
    var author: String?

}

