//
//  DetailViewController.swift
//  Project
//
//  Created by MacOS on 21/06/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var WhiteView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var label: UILabel!
    var details: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        WhiteView.layer.masksToBounds = true
        WhiteView.layer.cornerRadius = 20
        
        label.text = details
        // Do any additional setup after loading the view.
    }
    

    
     @IBAction func backbtn(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
