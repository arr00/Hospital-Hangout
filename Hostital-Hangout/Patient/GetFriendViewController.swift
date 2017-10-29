//
//  GetFriendViewController.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import UIKit

import FirebaseCore
import FirebaseDatabase



class GetFriendViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    var patient:Patient!
    var ref:DatabaseReference!
    @IBOutlet var mySwitch: UISwitch!
    
    
    @IBAction func switchMoved(_ sender: Any) {
        if(mySwitch.isOn) {
            ref.child("users/\(UIDevice.current.identifierForVendor!.uuidString)/wantsVisitor").setValue(1)
        }
        else {
            ref.child("users/\(UIDevice.current.identifierForVendor!.uuidString)/wantsVisitor").setValue(0)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let patientText = "\(patient.name), \(patient.age), \(patient.hospital), \(patient.language), \(patient.roomNumber)"
        print(patientText)
        
        ref = Database.database().reference()
    ref.child("users").child(UIDevice.current.identifierForVendor!.uuidString).setValue(["name":patient.name,"age":patient.age!,"hospital":patient.hospital!,"language":LanguageViewController.langToStr(lang: patient.language!),"roomNumber":patient.roomNumber!])
        
        nameLabel.text = "Hi " + patient.name + "!"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
