//
//  Volunteer.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import Foundation
import CoreLocation

class Volunteer:NSObject, CLLocationManagerDelegate {
    var name:String!
    var age:Int!
    var language:Language!
    var location:CLLocationCoordinate2D!
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
        self.language = Language.english
        
    }
    
    init(name:String, age:Int, language:Language) {
        self.name = name
        self.age = age
        self.language = language
        
    }
    
    public func updateLocation() {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.requestLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
        print("updated location")
        location = locations[0].coordinate
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("fail")
    }

    
}

enum Language {
    case english
    case spanish
    case chinese
}


