//
//  LeaveApplicationViewController.swift
//  edumeet
//
//  Created by MacOS on 26/06/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class LeaveApplicationViewController: UIViewController {

    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var StartDateTF: UITextField!
    
    @IBOutlet weak var StartTimeTF: UITextField!
    
    @IBOutlet weak var EndDateTF: UITextField!
    
    @IBOutlet weak var EndTimeTF: UITextField!
    
    @IBOutlet weak var AttachementField: UITextField!
    @IBOutlet weak var ReasonTF: UITextView!
    
    
    
    var jsondata = NSDictionary()
    var getdata = NSMutableData()
    var dict = NSDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func SubmitBtn(_ sender: Any) {
        
        let token = UserDefaults.standard.string(forKey:"value")
           let url = URL(string:"https://jeetmeet.b4production.com/api/student/leave/apply/save")
           var req = URLRequest(url: url!)
        req.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
                req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
                req.httpMethod = "POST"
          let poststring = "leave_category=\(categoryTF.text)&start_date=\(StartDateTF.text)&end_date=\(EndDateTF.text)&start_time=\(StartTimeTF.text)&end_time=\(EndTimeTF.text)&reason=\(ReasonTF.text)&attachment=\(AttachementField.text)"
   
                   req.httpBody = poststring.data(using: .utf8)
   
                   let task = URLSession.shared.dataTask(with:req) {(data,response,error) in
   
                   let mydata = data
   
                       do{
   
                           print("mydata",mydata!)
   
                           do{
   
                               self.getdata.append(mydata!)
   
                               let jsondata:NSDictionary = try JSONSerialization.jsonObject(with: self.getdata as Data, options: [])as! NSDictionary
   
                               print("jsondata",jsondata)
                               self.dict=jsondata["data"]as! NSDictionary
                               
                               print("dict--->", self.dict)
   
                               DispatchQueue.main.async {
                                   self.dismiss(animated: true)
                                   let alert = UIAlertController(title: "Success", message: "Leave application submitted successfully.", preferredStyle: .alert)
                                                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                                                            self.dismiss(animated: true, completion: nil)
                                                        }))
                                                        self.present(alert, animated: true, completion: nil)
                                   
                               }
   
                           }
   
                       }
   
                   catch{
   
                       print("error",error.localizedDescription)
   
                   }
   
                   }
   
                   task.resume()
    }
        

    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
