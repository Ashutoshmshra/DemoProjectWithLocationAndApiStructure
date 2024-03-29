//
//  MKJSONModel.swift
//  MountSinai
//
//  Created by Praveen on 22/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import Foundation
import Foundation
protocol MKJSONModel: Codable {
    init?(object: [String:Any])
    
}

extension MKJSONModel{
    init?(object: [String:Any]){
        let decoder = JSONDecoder()
       //decoder.keyDecodingStrategy = .convertFromSnakeCase
        let jsonData = try! JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
        self = try! decoder.decode(Self.self, from: jsonData as Data)
    }
    
    
    func toData()->Data?{
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(self)
            return jsonData
        }
        catch{
            
        }
        return nil
    }
    
    
    func toJSONObj()->Any?
    {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        
        guard let jsonData = try? jsonEncoder.encode(self) else {
            return nil
        }
        
        let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: [] )
        return jsonObj
    }
    
}
