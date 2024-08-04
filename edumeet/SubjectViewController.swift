//
//  SubjectViewController.swift
//  edumeet
//
//  Created by MacOS on 26/06/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class SubjectViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
  
    

    @IBOutlet weak var btnWhiteView: UIView!
    
   
    
    @IBOutlet weak var SubjectTV: UITableView!
    
    @IBOutlet weak var SubjecttableWhiteView: UIView!
    
    @IBOutlet weak var filterbtn: UIButton!
    
  var jsondata = NSDictionary()
    var data = NSArray()
    var dic = NSDictionary()
    var auth = NSDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnWhiteView.layer.masksToBounds = true
        btnWhiteView.layer.cornerRadius = 20




        filterbtn.layer.masksToBounds = true
        filterbtn.layer.cornerRadius = 20
        
        
        
        let token = UserDefaults.standard.string(forKey: "value")
        let url = URL(string: "https://jeetmeet.b4production.com/api/student/subjects")

        var urlreq = URLRequest(url: url!)
        urlreq.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        urlreq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        urlreq.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: urlreq){ (data,request,error)in
            if let mydata = data{
                do{
                    self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: []) as! NSDictionary
                    self.data = self.jsondata["subjects"] as! NSArray
                    print((self.data))
                    do{
                        DispatchQueue.main.async {
                            self.SubjectTV.reloadData()
                        }
                    }
                }
                catch{
                    print("error")
                }
            }
        }
        task.resume()
    }
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subjectcell", for: indexPath) as! SubjectTableViewCell
        self.dic = self.data[indexPath.row] as! NSDictionary
        
        cell.Author.text = String(describing: self.dic["author"]!)
        cell.TeacherName.text = String(describing: self.dic["teachers"]!)
        cell.SubjectName.text = String(describing: self.dic["name"]!)
        cell.PassMark.text = String(describing: self.dic["pass_mark"]!)
   

    
        return cell
    }
  
    
    
    
}
