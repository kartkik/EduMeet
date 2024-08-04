//
//  StaffViewController.swift
//  edumeet
//
//  Created by MacOS on 26/06/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class StaffViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var staffTbl: UITableView!
    
    var jsondata = NSDictionary()
    var arr = NSArray()
    var dict = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let token = UserDefaults.standard.string(forKey: "value")
        let url = URL(string: "https://jeetmeet.b4production.com/api/student/staff-directory")
        var urlstr = URLRequest(url: url!)
        urlstr.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlstr){
            (data,request,error) in
            if let mydata = data{
                do{
                    self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: []) as! NSDictionary
                    print(self.jsondata)
                    
                    do{
                        DispatchQueue.main.async {
                            self.staffTbl.reloadData()
                        }
                    }
                    
                }catch{
                    print("error", error.localizedDescription)
                }
            }
            
        };task.resume()

        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsondata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "staffcell") as! StaffTableViewCell
        self.arr = self.jsondata["data"] as! NSArray
        self.dict = self.arr[indexPath.row] as! NSDictionary
        cell.SubjectLbl.text = String(describing: self.dict["subject"]!)
        cell.TeacherLbl.text = String(describing: self.dict["teachers"]!)
        
        return cell
    }

    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
