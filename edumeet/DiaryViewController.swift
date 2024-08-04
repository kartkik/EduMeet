//
//  DiaryViewController.swift
//  edumeet
//
//  Created by MacOS on 26/06/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    

    @IBOutlet weak var tbl: UITableView!
    
    
    var jsondata = NSDictionary()
    var arr = NSArray()
    var dict = NSDictionary()

    
     override func viewDidLoad() {
        super.viewDidLoad()

         self.navigationController?.isNavigationBarHidden =  true
        
        
        
         let token = UserDefaults.standard.string(forKey: "value")
         let url = URL(string: "https://jeetmeet.b4production.com/api/student/diaries")
         var urlstr = URLRequest(url: url!)
         urlstr.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
         urlstr.httpMethod = "POST"
         urlstr.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
         
         let task  = URLSession.shared .dataTask(with: urlstr){
             (data,request,error)in
             
             if let mydata = data{
                
                 do{
                     self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: []) as! NSDictionary
                     
                  
                     
                     
                     do{
                         DispatchQueue.main.async {
                             self.tbl.reloadData()
                         }
                         
                     }
                     
                 }catch{
                     print("error")
                 }
             }
         };task.resume()
         
         
         
        
    }
    
    
   
    
    @IBAction func DiaryBtn(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(identifier: "diaryadd") as! DiaryAddViewController
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsondata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diarycell") as! DiaryTableViewCell
        self.arr = self.jsondata["data"] as! NSArray
        self.dict = self.arr[indexPath.row] as! NSDictionary
        
        cell.TopicLbl.text = String(describing: self.dict["note"]!)
        cell.DateLbl.text  = String(describing: self.dict["date"]!)
        cell.DiaryNo.text = String(describing: self.dict["id"]!)
        
        
        
        return cell
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
