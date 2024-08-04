//
//  TimeTableTableViewCell.swift
//  edumeet
//
//  Created by irohub on 03/07/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class TimeTableTableViewCell: UITableViewCell {

    @IBOutlet weak var periodLbl: UILabel!
    
    @IBOutlet weak var subjectLbl: UILabel!
    
    @IBOutlet weak var teacherLbl: UILabel!
    
    @IBOutlet weak var RoomLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
