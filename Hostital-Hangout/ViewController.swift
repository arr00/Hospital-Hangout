//
//  ViewController.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import UIKit
import CoreLocation
import FirebaseCore
import FirebaseDatabase


class ViewController: UIViewController, CLLocationManagerDelegate {
    var ref:DatabaseReference!
    var user:NSDictionary?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         ref = Database.database().reference()
        
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userExists" {
            let dest = segue.destination as! GetFriendViewController
            let patient = Patient(name: user!["name"] as! String, age: user!["age"] as! Int, hospital: user!["hospital"] as! String, language: LanguageViewController.strToLang(lang: user!["language"] as! String))
            patient.roomNumber = user!["roomNumber"] as! Int
            
            dest.patient = patient
        }
    }
    @IBAction func patient(_ sender: Any) {
        var userExists = false
        
        ref.child("users").observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.hasChild(UIDevice.current.identifierForVendor!.uuidString) {
                userExists = true
                self.user = snapshot.childSnapshot(forPath: UIDevice.current.identifierForVendor!.uuidString).value as? NSDictionary
                print("user exists")
            }
            else {
                userExists = false
                print("user doesnt exist")
            }
            
            if userExists {
                self.performSegue(withIdentifier: "userExists", sender: self)
                print("performing user exists segue")
            }
            else {
                self.performSegue(withIdentifier: "noUser", sender: self)
                print("user doesnt exist segue")
            }

            
            
        }
        
            }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("fail")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("got location")
    }


}

