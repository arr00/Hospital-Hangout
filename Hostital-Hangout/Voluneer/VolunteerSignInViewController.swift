//
//  VolunteerSignInViewController.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseCore

class VolunteerSignInViewController: UIViewController {

    var ref:DatabaseReference!
    @IBOutlet var verificationCodeField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

         ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    @IBAction func go(_ sender: Any) {
        ref.child("volunteers").observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.hasChild(self.verificationCodeField.text!) {
                //valid volunteer
                // = snapshot.childSnapshot(forPath: UIDevice.current.identifierForVendor!.uuidString).value as? NSDictionary
                print("user exists")
                self.performSegue(withIdentifier: "segue", sender: self)
            }
            else {
                let alert = UIAlertController(title: "Error", message: "Invalid Code", preferredStyle: .alert)
                self.show(alert, sender: self)
            }
           
            
            
            
        }
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
