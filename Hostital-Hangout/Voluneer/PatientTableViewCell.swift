//
//  PatientTableViewCell.swift
//  Hostital-Hangout
//
//  Created by Aryeh Greenberg on 10/29/17.
//  Copyright © 2017 Aryeh Greenberg. All rights reserved.
//

import UIKit

class PatientTableViewCell: UITableViewCell {

    @IBOutlet var hospitalLabe: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
