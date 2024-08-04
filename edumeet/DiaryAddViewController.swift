//
//  DiaryAddViewController.swift
//  edumeet
//
//  Created by iroid on 5/11/1403 AP.
//  Copyright © 1403 irohub. All rights reserved.
//

import UIKit

class DiaryAddViewController: UIViewController {

    @IBOutlet weak var date: UITextField!
    
    @IBOutlet weak var DiaryNote: UITextView!
    
    var jsondata = NSDictionary()
    var getdata = NSMutableData()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden =  true
    }
    
    @IBAction func DiarySubmitBtn(_ sender: Any) {
        
              let token = UserDefaults.standard.string(forKey: "value")
              let url = URL(string: "https://jeetmeet.b4production.com/api/student/diaries/save")
              var req = URLRequest(url: url!)
              
              req.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
              req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
              req.httpMethod = "POST"
              
        let poststring = "date=\(date.text!)&note=\(DiaryNote.text!)"
              
              
              
              
              req.httpBody = poststring.data(using: .utf8)
              
              let task = URLSession.shared .dataTask(with: req){
                  (data,response,error) in
                      
                      if let mydata = data{
                          do{
                            self.getdata.append(mydata)
                              self.jsondata = try JSONSerialization.jsonObject(with: self.getdata as Data, options: []) as! NSDictionary
                            print("jsondata", self.jsondata)
                            
                              do{
                                  DispatchQueue.main.async {
                                    let nav = self.storyboard?.instantiateViewController(identifier: "diary") as! DiaryViewController
                                    self.navigationController?.pushViewController(nav, animated: true)
                                      
                                  }
                              }
                          }
                          catch{
                              print("error", error.localizedDescription)
                          }
                          
                          
                      }
                  
                  
              }
              task.resume()
              
              
          }
    
    
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
