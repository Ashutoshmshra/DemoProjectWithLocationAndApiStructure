//
//  EventDataModel.swift
//  MountSinai
//
//  Created by Praveen on 14/12/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
struct EventDataModel: MKJSONModel {
    var status: Bool?
    var message: String?
    var data: ResponseEventModel?
    
}
struct ResponseEventModel: MKJSONModel {
    var upcomming_events: [EventModel]?
    var wellness_events: [EventModel]?
}
struct  EventModel: MKJSONModel{
    var href: String?
    var title: String?
    var date: String?
}
//struct  ResponseWellnessModel: MKJSONModel{
//    var href: String?
//    var title: String?
//    var date: String?
//}
//struct Title: MKJSONModel {
//    var EndNote Training for First Year Medical Students: Mac Users
//}
