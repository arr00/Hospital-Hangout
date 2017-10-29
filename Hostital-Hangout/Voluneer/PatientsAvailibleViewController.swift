//
//  PatientsAvailibleViewController.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PatientsAvailibleViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var ref:DatabaseReference!
    var selectedRow = -1
    var availiblePatients = [Patient]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(availiblePatients.count)" + " Rows ")
        return availiblePatients.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func updatePatients() {
        ref.child("users").observeSingleEvent(of: .value) { (snapshot) in
            self.availiblePatients.removeAll()
            print("updating users")
            for child in snapshot.children.allObjects {
                print("received object")
                
                
                //Iderate through children
                let childSc = child as! DataSnapshot
                
                let patient = Patient(user: (childSc.value as! NSDictionary))
                
                patient.key = childSc.key
                if patient.wantsVisitor == 1 {
                    self.availiblePatients.append(patient)
                }
                
                print(patient.name)
                
                
            }
            
            self.tableView.reloadData()
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id") as! PatientTableViewCell
        
        cell.nameLabel.text = "Name: " + availiblePatients[indexPath.row].name
        cell.hospitalLabe.text = "Hospital: " + availiblePatients[indexPath.row].hospital!
        cell.ageLabel.text = "Age: " + String(availiblePatients[indexPath.row].age!)
        cell.languageLabel.text = "Language: " + LanguageViewController.langToStr(lang: availiblePatients[indexPath.row].language!)
        
        return cell
    }
    


    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        availiblePatients = [Patient]()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        updatePatients()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        self.performSegue(withIdentifier: "segue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ConfirmationViewController
        dest.patient = availiblePatients[selectedRow]
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
