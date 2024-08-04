//
//  DiaryTableViewCell.swift
//  edumeet
//
//  Created by irohub on 03/07/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {

    @IBOutlet weak var DiaryNo: UILabel!
    @IBOutlet weak var TopicLbl: UILabel!
    @IBOutlet weak var DateLbl: UILabel!
    @IBOutlet weak var EditLbl: UILabel!
    @IBOutlet weak var DeleteLbl: UILabel!
    
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
      
        
        
    }
        override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
