//
//  UserItem.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit



struct UserItem: Codable {
    var gender:String?
    var name:Name?
    var email:String?
    var phone:String?
    var cell:String?
    var picture:Picture?
    
    var location:LocationEntity?
    
    struct Name: Codable {
        var title:String?
        var first:String?
        var last:String?
    }
    
    struct Picture: Codable {
        var large:String?
        var medium:String?
        var small:String?
    }
    
    struct LocationEntity: Codable {
        var city:String?
        var state:String?
        var country:String?
        var street:Street?
        var coordinates:Coordinates?
        
        struct Street: Codable {
            var number:Int = 0
            var name:String?
        }
        
        struct Coordinates: Codable {
            var latitude:String?
            var longitude:String?
        }
        
    }
    
}
