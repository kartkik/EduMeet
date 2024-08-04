

import UIKit

class UserSelectionViewController: UIViewController {
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var StudentBtn: UIButton!
    @IBOutlet weak var ParentBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StudentBtn.layer.cornerRadius = 12
        StudentBtn.layer.borderWidth = 1
        StudentBtn.layer.borderColor = UIColor.black.cgColor
        
        
        ParentBtn.layer.cornerRadius = 12
        ParentBtn.layer.borderWidth = 1
        ParentBtn.layer.borderColor = UIColor.black.cgColor

       
    }
    
    
    @IBAction func StudentAction(_ sender: Any) {
    }
    

    @IBAction func ParentAction(_ sender: Any) {
    }
}
