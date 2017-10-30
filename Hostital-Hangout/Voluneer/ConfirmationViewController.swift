//
//  ConfirmationViewController.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ConfirmationViewController: UIViewController {
    var patient:Patient!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var hospitalLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("users")
        nameLabel.text = "Visit to " + patient.name
        hospitalLabel.text = "Hospital: " + patient.hospital!
        ageLabel.text = "Age: " + String(patient.age!)
        languageLabel.text = "Language: " +  LanguageViewController.langToStr(lang: patient.language!)
        // Do any additional setup after loading the view.
    }

    @IBAction func confirm(_ sender: Any) {
        //Confirm, user not looking for visitor anymore
        ref.child(patient.key!).child("wantsVisitor").setValue(0)
        
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
