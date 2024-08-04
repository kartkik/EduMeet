//
//  TimetableViewController.swift
//  edumeet
//
//  Created by MacOS on 26/06/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class TimetableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var timeTableTV: UITableView!
    var jsondata = NSDictionary()
    var data = NSDictionary()
    var arr = NSArray()
    var dict = NSDictionary()
    var subb = NSDictionary()
    var tchr = NSDictionary()
    var room = NSDictionary()
    
    
    var frstnme = String()
    var midname = String()
    var lastname = String()

    @IBOutlet weak var WV: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WV.layer.masksToBounds = true
        WV.layer.cornerRadius = 20
        
        let token = UserDefaults.standard.string(forKey: "value")
            let url = URL(string: "https://jeetmeet.b4production.com/api/student/timetable")
            var urlRequest = URLRequest(url: url!)
            urlRequest.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")

            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                
                
                
                if let mydata = data {
                    do {
                        self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: []) as! NSDictionary
                           
                            print("jsondata--->>", self.jsondata)
                            
                            DispatchQueue.main.async {
                                self.timeTableTV.reloadData()
                            }
                        
                    } catch {
                        print("error:", error.localizedDescription)
                    }
                }
            }
            task.resume()
        

        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsondata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "timetablecell") as! TimeTableTableViewCell
        self.data = self.jsondata["data"] as! NSDictionary
        self.arr = self.data["4"] as! NSArray
        self.dict = self.arr[indexPath.row] as! NSDictionary
        self.subb = self.dict["subjectname"] as! NSDictionary
        self.tchr = self.dict["teachername"]as! NSDictionary
        self.room = self.dict["roomname"]as! NSDictionary
        self.frstnme = String(describing: self.tchr["first_name"]!)
        self.lastname = String(describing: self.tchr["last_name"]!)
        
        cell.teacherLbl.text = "\(frstnme) \(lastname)"
        cell.periodLbl.text = String(describing: self.dict["slot"]!)
        cell.subjectLbl.text = String(describing: self.subb["name"]!)
        cell.RoomLbl.text = String(describing: self.room["name"]!)
        
        return cell
        
        
    }

  
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
