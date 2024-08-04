//
//  LeaveTableViewCell.swift
//  edumeet
//
//  Created by irohub on 03/07/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class LeaveTableViewCell: UITableViewCell {

    @IBOutlet weak var DateLbl: UILabel!
    @IBOutlet weak var NameLbl: UILabel!
    
    @IBOutlet weak var daysLbl: UILabel!
    @IBOutlet weak var AttachementLbl: UILabel!
    @IBOutlet weak var ReasonLbl: UILabel!
    @IBOutlet weak var ScheduleLbl: UILabel!
    @IBOutlet weak var CasualLbl: UILabel!
    @IBOutlet weak var StatusLbl: UILabel!
    @IBOutlet weak var TblBckView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func editBtn(_ sender: Any) {
    }
    @IBAction func deleteBtn(_ sender: Any) {
    }
}
