//
//  AssignedLeaveViewController.swift
//  edumeet
//
//  Created by MacOS on 26/06/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class AssignedLeaveViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    
    
    
    
    
    
    
   
    


    @IBOutlet weak var WV: UIView!
    @IBOutlet weak var seg: UISegmentedControl!
    
    @IBOutlet weak var assignedTbl: UITableView!
    
    var jsondata = NSDictionary()
    var datadic = NSDictionary()
    var arr = NSArray()
    var lv = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WV.layer.masksToBounds = true
        WV.layer.cornerRadius = 25
        
        
        let token = UserDefaults.standard.string(forKey: "value")
        let url = URL(string: "https://jeetmeet.b4production.com/api/student/leave/assigned")
        var urlreq = URLRequest(url: url!)
        urlreq.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        urlreq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        urlreq.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: urlreq){(data, request, error) in
            if let mydata = data{
                do{
                    self.jsondata  = try JSONSerialization.jsonObject(with: mydata, options: []) as! NSDictionary
                    do{
                        DispatchQueue.main.async {
                            self.assignedTbl.reloadData()
                        }
                    }
                }
                catch{
                    print("error")
                }
            }
            
        }
        task.resume()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jsondata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "assignedtablecell") as! AssignedLeaveTableViewCell
        self.arr = self.jsondata["data"] as! NSArray
        self.datadic = self.arr[indexPath.row] as! NSDictionary
        self.lv = self.datadic["leavecategoryname"] as! NSDictionary
        
        
        cell.Days.text = String(describing: self.datadic["no_of_day"]!)
        cell.Annual.text = String(describing: self.lv["name"]!)
        return cell
    }
    
    @IBAction func segment(_ sender: Any) {
        if seg.selectedSegmentIndex == 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "assignedlv") as! AssignedLeaveViewController
            let navigationController = UINavigationController(rootViewController: vc)
            self.present(navigationController, animated: true, completion: nil)
    
                  
               }else if seg.selectedSegmentIndex == 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "leave") as! LeaveViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
                   
               }else{
        }
              
               
           }
    }
    
  



