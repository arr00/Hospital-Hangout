//
//  LanguageViewController.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    var patient:Patient!
    
    @IBOutlet var picker: UIPickerView!
    let languages = [Language.english,Language.spanish,Language.chinese]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func next(_ sender: Any) {
        patient.language = languages[picker.selectedRow(inComponent: 0)]
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return LanguageViewController.langToStr(lang: languages[row])
    }
    
    public static func langToStr(lang:Language) -> String {
        switch lang {
            case .english:
                return "English"
            case .spanish:
                return "Spanish"
            case .chinese:
                return "Chinese"
        }
    }
    public static func strToLang(lang:String) -> Language {
        switch lang {
        case "English":
            return .english
        case "Spanish":
            return .spanish
        case "Chinese":
            return .chinese
        default:
            return .english
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! AgeViewController
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
