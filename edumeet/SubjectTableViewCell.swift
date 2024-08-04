//
//  SubjectTableViewCell.swift
//  edumeet
//
//  Created by MacOS on 26/06/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {

    
    @IBOutlet weak var SubjectName: UILabel!
    @IBOutlet weak var TeacherName: UILabel!
    @IBOutlet weak var Author: UILabel!
    @IBOutlet weak var PassMark: UILabel!
    @IBOutlet weak var FinalMark: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
