//
//  AssignedLeaveTableViewCell.swift
//  edumeet
//
//  Created by irohub on 03/07/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class AssignedLeaveTableViewCell: UITableViewCell {

    @IBOutlet weak var Annual: UILabel!
    @IBOutlet weak var Days: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
