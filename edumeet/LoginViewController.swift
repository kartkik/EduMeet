//
//  LoginViewController.swift
//  edumeet
//
//  Created by irohub on 03/07/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var UsernameTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    var getdata = NSMutableData()
    var jsondata = NSDictionary()
    
    
    @IBOutlet var forgotpasswordbtn: UIView!
    
    @IBOutlet weak var LoginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
    }
    

    @IBAction func Login(_ sender: Any) {
        
        if UsernameTF.text == ""{
          let alert1 =  UIAlertController(title: "alert", message: "enter the username", preferredStyle: .alert)
            
            
            alert1.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert1, animated: true,completion: nil)
            
            
        }else if PasswordTF.text == ""{
            
            let alert2 = UIAlertController(title: "Alert", message: "Enter Password", preferredStyle: .alert)
            
            alert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert2, animated: true, completion: nil)
            
            
        }else if UsernameTF.text == "" || PasswordTF.text == ""{
            
            let alert3 = UIAlertController(title: "Alert", message: "Enter Username and Password to Login", preferredStyle: .alert)
            
            alert3.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert3, animated: true, completion: nil)
            
            
        }else{
            let alert4 = UIAlertController(title: "ALert", message: "Login Successfull", preferredStyle: .alert)
            
            alert4.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert4, animated: true, completion:  nil)
        }
        
        
        
        
        
        
        
        let url = URL(string: "https://jeetmeet.b4production.com/api/student/login")
        
        var req = URLRequest(url: url!)
        req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        req.httpMethod = "POST"
        
        let poststring = "username=\(UsernameTF.text!)& password=\(PasswordTF.text!)"
        
        req.httpBody = poststring.data(using: .utf8)
        
        let task = URLSession.shared .dataTask(with: req){
            (data , responce, error)in
            
            
            let mydata = data
            do{
                        print("mydata__>>",mydata!)
            
            
            do{
                self.getdata.append(mydata!)
                
                let jsondata = try JSONSerialization.jsonObject(with: self.getdata as Data, options: []) as! NSDictionary
                
                
                DispatchQueue.main.async {
                UserDefaults.standard.set(jsondata["message"], forKey:
                    "value")
                    
                    
                    let nav = self.storyboard?.instantiateViewController(identifier: "dashboard") as! ProfileViewController
                    
                    
                    
                    self.navigationController?.pushViewController(nav, animated: true)
                }
                
            }
            
            
            
            }
            
            
            catch{
                print("error",error.localizedDescription)
            }
            
            
        }
        
        task.resume()
        
    }
    

}
