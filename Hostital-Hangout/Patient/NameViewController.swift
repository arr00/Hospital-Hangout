//
//  NameViewController.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    var patient:Patient?
    @IBAction func nextButton(_ sender: Any) {
        patient = Patient(name: nameTextField.text!)
        self.performSegue(withIdentifier: "segue", sender: self)
        
    }
    
    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? HospitalViewController {
           dest.patient = patient!
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
