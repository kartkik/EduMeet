//
//  ProfileDetailViewController.swift
//  edumeet
//
//  Created by irohub on 25/06/24.
//  Copyright © 2024 irohub. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {

    @IBOutlet weak var ProfileImg: UIImageView!
    @IBOutlet weak var Profilelbl: UILabel!
    @IBOutlet weak var RegNolbl: UILabel!
    @IBOutlet weak var parentDetailVW: UIView!
    @IBOutlet weak var Parentlbl: UILabel!
    
    @IBOutlet weak var Genderlbl: UILabel!
    @IBOutlet weak var Classlbl: UILabel!
    @IBOutlet weak var Divisionlbl: UILabel!
    @IBOutlet weak var RollNolbl: UILabel!
    @IBOutlet weak var DOBlbl: UILabel!
    @IBOutlet weak var Phonelbl: UILabel!
    
    
    @IBOutlet weak var EmailLbl: UILabel!
    @IBOutlet weak var SecondaryPhonelbl: UILabel!
    @IBOutlet weak var Addresslbl: UILabel!
    @IBOutlet weak var PostCodelbl: UILabel!
    @IBOutlet weak var BloodGrpLbl: UILabel!
    @IBOutlet weak var StateLbl: UILabel!
    @IBOutlet weak var CountryLbl: UILabel!
    @IBOutlet weak var NationalityLbl: UILabel!
    @IBOutlet weak var FirstDetailsView: UIView!
    
    @IBOutlet weak var SecondDetailView: UIView!
    
    
    var firstName = String()
    var midName = String()
    var lastName = String()
    var gender = String()
    
    var division = String()
    var rollNo = String()
    var Dob = String()
    var phone = String()
    
    var parntFirst = String()
    var parntLast = String()
    
    
    
    var jsondata = NSDictionary()
    var  data = NSDictionary()
    var div = NSDictionary()
    var state = NSDictionary()
    var country = NSDictionary()
    var nationality = NSDictionary()
    var cls = NSDictionary()
    var par = NSDictionary()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProfileImg.layer.masksToBounds = true
        
        ProfileImg.layer.cornerRadius = ProfileImg.frame.size.width / 2
        
        
        parentDetailVW.layer.masksToBounds =  true
        parentDetailVW.layer.cornerRadius = 50
        
        FirstDetailsView.layer.masksToBounds = true
        FirstDetailsView.layer.cornerRadius = 20
        
        
        SecondDetailView.layer.masksToBounds = true
        SecondDetailView.layer.cornerRadius = 20
        
        let token = UserDefaults.standard.string(forKey: "value")
        
        let url = URL(string: "https://jeetmeet.b4production.com/api/student/details")
        var urlstr = URLRequest(url: url!)
        
        urlstr.setValue( "Bearer \(token!)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared .dataTask(with: urlstr){
            (data,request,error)in
            
            if let mydata = data{
                print("mydata--->", mydata)
                do{
                    self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: []) as! NSDictionary
                    
                    self.data = self.jsondata["data"] as! NSDictionary
                    self.div = self.data["divisions" ] as! NSDictionary
                    self.state = self.data["states"] as! NSDictionary
                    self.country = self.data["countries"] as! NSDictionary
                    self.nationality = self.data["nationalities"] as! NSDictionary
                    self.cls = self.data["classname"] as! NSDictionary
                    self.par = self.data["parents"] as! NSDictionary
                    
                    print("jsondata--->", self.jsondata)
                    
                    do{
                        DispatchQueue.main.async {
                            self.firstName = String(describing: self.data["first_name"]!)
                            self.midName = String(describing: self.data["middle_name"]!)
                            self.lastName = String(describing: self.data["last_name"]!)
                            
                            self.parntFirst = String(describing: self.par["first_name"]!)
                            self.parntLast = String(describing: self.par["last_name"]!)
                            
                            
                            
                            
                            
                            
                            
                            self.Profilelbl.text = self.firstName + " " + self.midName + " " + self.lastName
                            
                            self.Parentlbl.text = self.parntFirst + " " + self.parntLast
                            self.gender = String(describing: self.data["gender"]!)
                            self.Classlbl.text = String(describing: self.cls["name"]!)
                            self.Divisionlbl.text = String(describing: self.div["name"]!)
                            self.RollNolbl.text = String(describing: self.data["roll_number"]!)
                            self.RegNolbl.text = String(describing: self.data["reg_number"]!)
                            self.DOBlbl.text = String(describing: self.data["dob"]!)
                            self.Phonelbl.text = String(describing: self.data["phone"]!)
                            
                            
                            
                            self.EmailLbl.text = String(describing: self.data["email"]!)
                            self.SecondaryPhonelbl.text = String(describing: self.data["phone2"]!)
                            self.Addresslbl.text = String(describing: self.data["address"]!)
                            self.PostCodelbl.text = String(describing: self.data["post"]!)
                            self.BloodGrpLbl.text = String(describing: self.data["blood"]!)
                            self.StateLbl.text = String(describing: self.state["name"]!)
                            self.CountryLbl.text = String(describing: self.country["name"]!)
                            self.NationalityLbl.text = String(describing: self.nationality["name"]!)
                            
                            
                            
                            
                          
//
//                            let proflimg = String(describing: self.data["profile_image"]!)
//                            let urlimg = URL(string: proflimg)
//                            let dataimg = try? Data(contentsOf: urlimg!)
//                            self.ProfileImg.image = UIImage(data: dataimg!)
                          
//                            
//                            let prntimg = String(describing: self.par["photo"])
//                            let url = URL(string: prntimg!)
//                            
//                            let dataimg = try? Data(contentsOf: url!)
//                            self.parentImg.image = UIImage(data: dataimg)
                            
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

    @IBAction func backBtn(_ sender: Any) {
    
        self.navigationController?.popViewController(animated: true)
    }
}
