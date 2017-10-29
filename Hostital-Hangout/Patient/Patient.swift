//
//  Patient.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import Foundation
import CoreLocation

class Patient:NSObject {
    var name:String!
    var age:Int?
    var language:Language?
    var hospital:String?
    var roomNumber:Int?
    
    init(name:String) {
        self.name = name
    
    }
    
    init(name:String, age:Int, hospital:String, language:Language) {
        self.name = name
        self.age = age
        self.language = language
        self.hospital = hospital
    }
    
    
    
}
