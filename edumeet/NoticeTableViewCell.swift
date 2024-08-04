////  NoticeTableViewCell.swift
//  Project
//
//  Created by MacOS on 21/06/24.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {

    @IBOutlet weak var tblHeadlbl: UILabel!
   
    @IBOutlet weak var tblDesclbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
