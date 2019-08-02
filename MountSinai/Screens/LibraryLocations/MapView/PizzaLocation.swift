//
//  PizzaLocation.swift
//  MountSinai
//
//  Created by Praveen on 24/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class PizzaLocation: NSObject, MKAnnotation{
    var identifier = "pizza location"
    var title: String?
    var coordinate: CLLocationCoordinate2D
    init(name:String,lat:CLLocationDegrees,long:CLLocationDegrees){
        title = name
        coordinate = CLLocationCoordinate2DMake(lat, long)
    }
}


class PizzaLocationList: NSObject {
    var restaurant = [PizzaLocation]()
    override init(){
        restaurant += [PizzaLocation(name:"Connie's Pizza",lat:41.84937922,long:-87.6410584  )]
        restaurant += [PizzaLocation(name:"Connie's Pizza",lat:41.90146341,long: -87.62848137 )]
        restaurant += [PizzaLocation(name:"Connie's Pizza",lat:41.85110748,long: -87.61286663 )]
        restaurant += [PizzaLocation(name:"Connie's Pizza",lat:41.89224916,long:-87.60951805  )]
        restaurant += [PizzaLocation(name:"Giordano's",lat:42.00302015,long:-87.81630768  )]
        restaurant += [PizzaLocation(name:"Giordano's",lat:41.79915575,long:-87.59028088)]
        restaurant += [PizzaLocation(name:"Giordano's",lat:41.85776469,long:-87.66138509)]
        restaurant += [PizzaLocation(name:"Giordano's",lat:41.95296188,long:-87.77541371)]
        restaurant += [PizzaLocation(name:"Pequod's",lat:41.92185084,long:-87.66451631)]
        restaurant += [PizzaLocation(name:"Pizzeria DUE",lat:41.89318499,long:-87.62661003)]
        restaurant += [PizzaLocation(name:"Pizzeria UNO",lat:41.8924923,long:-87.626859)]
        restaurant += [PizzaLocation(name:"Gino's East",lat:41.8959379,long:-87.6229284)]
        restaurant += [PizzaLocation(name:"Lou Malnati's",lat:41.95340615,long:-87.73214376)]
        restaurant += [PizzaLocation(name:"Lou Malnati's",lat:41.87169869,long:-87.62737565)]
        restaurant += [PizzaLocation(name:"Lou Malnati's",lat:41.96074325,long:-87.6835484)]
        restaurant += [PizzaLocation(name:"Lou Malnati's",lat:41.88411358,long:-87.65808167)]
        restaurant += [PizzaLocation(name:"Lou Malnati's",lat:41.85186556,long:-87.72202439)]
        restaurant += [PizzaLocation(name:"Lou Malnati's",lat:41.90239382,long:-87.62846892)]
        restaurant += [PizzaLocation(name:"Lou Malnati's",lat:41.89031406,long:-87.63388913)]
        restaurant += [PizzaLocation(name:"Lou Malnati's",lat:41.92911995,long:-87.65359186)]
        restaurant += [PizzaLocation(name:"Lou Malnati's",lat:41.9089214,long:-87.6775678)]
    }
}
