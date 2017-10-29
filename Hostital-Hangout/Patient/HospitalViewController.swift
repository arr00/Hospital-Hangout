//
//  HospitalViewController.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import UIKit

class HospitalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var hospitals = ["Ama","few ", "few"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    var patient:Patient!
    
    @IBAction func nextButton(_ sender: Any) {
        patient.hospital = hospitals[picker.selectedRow(inComponent: 0)]
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    
    @IBOutlet var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        picker.delegate = self
        picker.dataSource = self
        
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hospitals.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hospitals[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! RoomViewController
        dest.patient = patient
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
