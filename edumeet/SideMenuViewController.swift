//
//  SideMenuViewController.swift
//  edumeet
//
//  Created by MacOS on 26/06/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
  
   var jsondata = NSDictionary()
    
    
    @IBOutlet weak var SideMenuPI: UIImageView!
    
    var side = ["Dashboard","Personal","Diary","Staff","Subject","Time table","Leave Application","Leave","Assigned Leave","Logout"]
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        SideMenuPI.layer.masksToBounds = true
        SideMenuPI.layer.cornerRadius = SideMenuPI.frame.size.width / 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return side.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sidemenu = tableView.dequeueReusableCell(withIdentifier: "sidemenu", for: indexPath) as! SideMenuTableViewCell
        sidemenu.textLabel?.text = side[indexPath.row]
        return sidemenu
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let nav  = self.storyboard?.instantiateViewController(withIdentifier: "dashboard")as! ProfileViewController
            self.navigationController?.pushViewController(nav, animated: true)
            
        }else if indexPath.row == 1{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "profile") as! ProfileDetailViewController
            self.navigationController?.pushViewController(nav, animated: true)
        }
        else if indexPath.row == 2{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "diary") as! DiaryViewController
            self.navigationController?.pushViewController(nav, animated: true)
        }else if indexPath.row == 3{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "staff")as! StaffViewController
            self.navigationController?.pushViewController(nav, animated: true)
            
        }else if indexPath.row == 4{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "subject") as! SubjectViewController
            self.navigationController?.pushViewController(nav, animated: true)
            
            
        }else if indexPath.row == 5{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "timetable")as! TimetableViewController
            self.navigationController?.pushViewController(nav, animated: true)
            
        }else if indexPath.row == 6{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "lvapplication") as! LeaveApplicationViewController
            self.navigationController?.pushViewController(nav, animated: true)
        }else if indexPath.row == 7{
            
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "leave")as! LeaveViewController
            self.navigationController?.pushViewController(nav, animated: true)
            
        }else if indexPath.row == 8{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "assignedlv") as! AssignedLeaveViewController
            self.navigationController?.pushViewController(nav, animated: true   )
            
        }else if indexPath.row == 9{
            let token = UserDefaults.standard.string(forKey: "value")
            let url = URL(string: "https://jeetmeet.b4production.com/api/student/login")
            
            var req = URLRequest(url: url!)
            req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
            req.httpMethod = "POST"
            req.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
            let task = URLSession.shared.dataTask(with: req){(data,request,error)in
                if let mydata = data{
                    do{
                        self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: [])
as! NSDictionary
                        do{
                            DispatchQueue.main.async {
                                let nav = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                                self.navigationController?.pushViewController(nav, animated: true)
                                
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
  

}
}

