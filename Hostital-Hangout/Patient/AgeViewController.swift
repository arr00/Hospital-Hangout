//
//  AgeViewController.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import UIKit

class AgeViewController: UIViewController {
    var patient:Patient!
    @IBOutlet var age: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func next(_ sender: Any) {
        patient.age = Int(age.text!)
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? GetFriendViewController {
            dest.patient = patient
        }
        
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
