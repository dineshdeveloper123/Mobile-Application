
import UIKit

class BtnClass: UITableViewCell {

    @IBOutlet var dataName: UILabel!
    
    @IBOutlet var dataMobile: UILabel!
    
    @IBOutlet var moreBtn: UIButton!
    @IBOutlet var roleLbl: UILabel!
    @IBOutlet var emailLbl: UILabel!
    @IBOutlet var cityLbl: UILabel!
    
    var buttonClicked:(()->(Void))!
    
    func configureCell(name: String, phone: String, city:String, email:String, role:String) {
        dataName.text = name
        dataMobile.text = phone
        roleLbl.text = "Role : \(role)"
        emailLbl.text = "Email : \(email)"
        cityLbl.text = "\(name) From - \(city)"
        
        dataName.font = UIFont(name: "GillSans-SemiBold", size: 20)
            
        }
    
    
    @IBAction func rightBtn(_ sender: UIButton) {
        buttonClicked()
        
    }
    
    
}
