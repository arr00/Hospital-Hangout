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
    var wantsVisitor:Int?
    var key:String?
    
    init(name:String) {
        self.name = name
    
    }
    
    init(name:String, age:Int, hospital:String, language:Language) {
        self.name = name
        self.age = age
        self.language = language
        self.hospital = hospital
    }
    
    convenience init(user:NSDictionary?) {
        self.init(name: user!["name"] as! String, age: user!["age"] as! Int, hospital: user!["hospital"] as! String, language: LanguageViewController.strToLang(lang: user!["language"] as! String))
        roomNumber = user!["roomNumber"] as! Int
        
        wantsVisitor = user!["wantsVisitor"] as? Int
        
    }
    
    
    
}
