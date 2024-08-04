//
//  LeaveViewController.swift
//  edumeet
//
//  Created by MacOS on 26/06/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class LeaveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var LveTbl: UITableView!
    @IBOutlet weak var WV: UIView!
    @IBOutlet weak var FilterBtn: UIButton!
    
    
    var jsondata = NSDictionary()
    var arr = NSArray()
    var dict = NSDictionary()
    var stdata = NSDictionary()
    var lvdata = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        WV.layer.masksToBounds = true
        WV.layer.cornerRadius = 20
        
        FilterBtn.layer.masksToBounds = true
        FilterBtn.layer.cornerRadius = 20

        self.navigationController?.isNavigationBarHidden = true
        
        
        let token = UserDefaults.standard.string(forKey: "value")
        let url = URL(string: "https://jeetmeet.b4production.com/api/student/leave/apply")
        var req =  URLRequest(url: url!)
        req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        req.httpMethod = "POST"
        req.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        
        
        let task = URLSession.shared .dataTask(with: req){
            (data,request,error) in
            
            if let mydata = data{
                do{
                    self.jsondata = try JSONSerialization.jsonObject(with: mydata,options: []) as! NSDictionary
                    
                    self.arr = self.jsondata["data"] as! NSArray
                    print(self.arr)
                    
                    do{
                        DispatchQueue.main.async {
                            self.LveTbl.reloadData()
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leavecell") as!LeaveTableViewCell
        self.arr = self.jsondata["data"] as! NSArray
        self.dict = self.arr[indexPath.row] as! NSDictionary
        self.stdata = self.dict["studentname"] as! NSDictionary
        self.lvdata = self.dict["leave_categoryname"] as! NSDictionary
        
        let firstnme = String(describing: self.stdata["first_name"]!)
        let midname = String(describing: self.stdata["middle_name"]!)
        let lastname = String(describing: self.stdata["last_name"]!)
        
        
        cell.NameLbl.text = "\(firstnme) \(midname) \(lastname)"
        cell.DateLbl.text = String(describing: self.dict["from_date"])
        cell.CasualLbl.text = String(describing: self.dict["reason"])
        return cell
    }
    
    
    @IBAction func AddLeave(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "leaveApp") as! LeaveApplicationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
   

}
