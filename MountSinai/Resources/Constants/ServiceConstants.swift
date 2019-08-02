//
//  ServiceConstants.swift
//  MountSinai
//
//  Created by Praveen on 21/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
import UIKit

struct  MKServiceConstants {
    
    static let BaseURL = "http://mountsiani.mobikasa.net"
    static let VersionURL = "/api/v1"
    static let pageData = "/get-page-data?record_from="
    static let bookData = "/get-inner-data?record_from="
    static let eventData = "/get-events"
    static let specialTopicData = "/get-specialtopics-page-data"
    static let latestNewsData = "/get-blog-page-data"
    
    
    static let homeCollectionApi = BaseURL + VersionURL + pageData
    static let homeBooksApi = BaseURL + VersionURL + bookData
    static let eventApi = BaseURL + VersionURL + eventData
    static let specialTopicAPI = BaseURL + VersionURL + specialTopicData
    static let LatestNewsAPI = BaseURL + VersionURL + latestNewsData
    
}
//struct AppConstant {
//    static let AccessTokenKey = "Authorization"
//    static let Appversion = "1.0"
//    static let WebURl = " https://libguides.mssm.edu/blog "
//}
