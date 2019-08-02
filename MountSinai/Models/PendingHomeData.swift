//import Foundation
//import  UIKit
//
//struct PendingData:MKJSONModel {
//    let status: Bool
//    let message: String
//    let recordsPerPage, recordsShowing: Int
//    let data: DataClass
//    
////    enum CodingKeys: String, CodingKey {
////        case status, message
////        case recordsPerPage = "records_per_page"
////        case recordsShowing = "records_showing"
////        case data
////    }
//}
//
//struct DataClass: MKJSONModel {
//    let listArray: [ListArray]
//    
//    enum CodingKeys: String, CodingKey {
//        case listArray = "list_array"
//    }
//}
//
//struct ListArray: Codable {
//    let title: String
//    let href: String
//}
