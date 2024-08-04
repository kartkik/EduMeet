import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    


    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var parentImgView: UIImageView!
    @IBOutlet weak var tblWhiteView: UIView!
    @IBOutlet weak var noticeTableView: UITableView!
    @IBOutlet weak var menubutton: UIBarButtonItem!
    @IBOutlet weak var dob: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
   
    @IBOutlet weak var ClassNO: UILabel!
    
    @IBOutlet weak var rollNo: UILabel!
    
    @IBOutlet weak var division: UILabel!
    @IBOutlet weak var regNo: UILabel!
    @IBOutlet weak var parentName: UILabel!
    
    var jsondata = NSDictionary()
    var dataarray = NSArray()
    var dic = NSDictionary()
    var notice = [[String: Any]]()
    var profile = NSDictionary()
    var parents = NSDictionary()
    
    
    var firstname = String()
    var middlename = String()
    var lastname = String()
    var Cls = String()
    var roll = String()
    var reg = String()
    var dateofb = String()
    var div = String()
    var parFirst = String()
    var parLast = String()
    
    
    
    
 
    
    
    
    let notices = [
          ["title": "Programming Contest", "description": "The International Collegiate Programming Contest is an algorithmic programming contest..."],
          ["title": "Parents Meeting", "description": "PTA addresses issues that are important to parents and public school administrators. We..."],
          ["title": "College Day", "description": "The annual college day celebration is organised by the management, students with..."]
      ]
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

//
        self.navigationController?.isNavigationBarHidden =  true
        self.title = "EduMeet"
        
        
        
      

        
 
//        let screenHeight = view.frame.height
//        let screenWidth = view.frame.width
//        redView.frame = CGRect(x: 0, y: screenHeight / 2, width: screenWidth, height: screenHeight / 2)

        
        
        addBottomRoundedEdge(to: redView, desiredCurve: 1.0)
        
       
        whiteView.layer.cornerRadius = 20
        whiteView.layer.shadowColor = UIColor.black.cgColor
        whiteView.layer.shadowOffset = CGSize(width: 3, height: 3)
        whiteView.layer.shadowOpacity = 0.3
        whiteView.layer.shadowRadius = 2.0

        
        profileImgView.layer.masksToBounds = true
        
        
        profileImgView.layer.cornerRadius = profileImgView.frame.size.width / 2

        
        parentImgView.layer.masksToBounds = true
        parentImgView.layer.cornerRadius = parentImgView.frame.size.width / 2

        
        tblWhiteView.layer.masksToBounds = true
        tblWhiteView.layer.cornerRadius = 20
        
        
        
        
        
        
        let token = UserDefaults.standard.string(forKey: "value")
        
        print("token-->" , token!)
        let url = URL(string: "https://jeetmeet.b4production.com/api/student/dashboard")
        var urlstr = URLRequest(url: url!)
           urlstr.setValue( "Bearer \(token!)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared .dataTask(with: urlstr){
            (data, request, error) in
            
            if let mydata = data{
                
                print("mydata-->", mydata)
                do{
                    self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: []) as! NSDictionary
                    
                    
                    self.dic = self.jsondata["student"] as! NSDictionary
                    self.parents = self.dic["parents"] as! NSDictionary
                 
                    self.notice = self.jsondata["notice"] as! [[String: Any]]
                    
                    
                    
//                    self.notice = self.jsondata["notice"] as! NSArray
//                    print("notices  //////////",self.notice)
                    
                   
                    
                    print("dic",self.dic)
                    
                    do{
                        DispatchQueue.main.async {
                            self.noticeTableView.reloadData()
                            
                            

//                            let profileimg = String(describing: self.dic["profile_image"]!)
                            
//                            let urlimage = URL(string: profileimg)
//                            let dataimg = try? Data(contentsOf: urlimage!)
//                            self.profileImgView.image = UIImage(data: dataimg!)


                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
//                            if let profileImgUrlString = self.dic["profile_image"] as? String,
//                                                  let profileImgUrl = URL(string: profileImgUrlString),
//                                                  let profileImgData = try? Data(contentsOf: profileImgUrl)
//                            {
//                                                   self.profileImgView.image = UIImage(data: profileImgData)
//
//                            }
                            
                            
                            self.firstname = String(describing: self.dic["first_name"]!)
                            self.lastname = String(describing: self.dic["middle_name"]!)
                            self.middlename = String(describing: self.dic["middle_name"]!)
                            self.Cls = String(describing: self.dic["class"]!)
                            self.div = String(describing: self.dic["division"]!)
                            self.roll =  String(describing: self.dic["roll_number"]!)
                            self.reg = String(describing: self.dic["reg_number"])
                            self.dateofb = String(describing: self.dic["dob"]!)
                            
                            
                            
                            self.parFirst = String(describing: self.parents["first_name"]!)
                            self.parLast = String(describing: self.parents["last_name"]!)
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            self.name.text = self.firstname + " " + self.middlename + " " + self.lastname
                            self.ClassNO.text = "Class :\(self.Cls)"
                            self.division.text = "Divison : \(self.div)"
                            self.rollNo.text = "Roll no : \(self.roll)"
                            self.regNo.text = "Reg No :\(self.roll)"
                            self.dob.text = "DOB :\(self.dateofb)"
                            
                            
                            self.parentName.text = self.parFirst + " " + self.parLast
                            
                            
                            
                            
                            
                        }
                    }
                    
                }
                catch{
                    print("error",error.localizedDescription)
                }
            }
        }
        task.resume()
        
         
        
        
        
        
        
        
        
        
    }
    
    
    
  
    
    
    
    
    func addBottomRoundedEdge(to view: UIView ,desiredCurve: CGFloat?) {
           let offset: CGFloat = view.frame.width / desiredCurve!
           let bounds: CGRect = view.bounds
           
           let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
           let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
           let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
           let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
           rectPath.append(ovalPath)

           let maskLayer: CAShapeLayer = CAShapeLayer()
           maskLayer.frame = bounds
           maskLayer.path = rectPath.cgPath
           
           view.layer.mask = maskLayer
       }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notice.count
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "noticeCell", for: indexPath) as! NoticeTableViewCell
        
        
//        let noticedata = self.dic["notice"] as![[String: Any]]
//        print("/////////", noticedata)
     
        let notices = notice[indexPath.row]
        
        
        cell.tblHeadlbl.text = notices["title"] as? String
        cell.tblDesclbl.text = notices["description"] as? String
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notices = notice[indexPath.row]
        
         let description = notices["description"]
        
        
        guard let nav = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            print("DetailViewController not found")
            return
        }
        
        nav.details = description! as! String
        
        guard let navigationController = self.navigationController else {
            print("Navigation controller not found")
            return
        }
        
        navigationController.pushViewController(nav, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 80    }
//
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerview = UIView(frame: CGRect(x: 0, y: 0, width: self.noticeTableView.frame.width, height: 100))
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.noticeTableView.frame.width, height: 100))
//
//        label.text = "Notice"
//
//        headerview.addSubview(label)
//        return headerview
//    }
//
    
    
    
    
    
    
    
    
    
    
}
