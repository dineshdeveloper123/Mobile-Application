//
//  TabBarChatTableCellTableViewCell.swift
//  LoginChange
//
//  Created by Rifluxyss on 24/09/24.
//

import UIKit

class TabBarChatTableCellTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var profileName: UILabel!
    @IBOutlet var profileTime: UILabel!
    @IBOutlet var profileDate: UILabel!
    

    
    func ChatCell(name: String,date:String,time:String,img:String) {
        profileName.text = name
        profileDate.text = date
        profileTime.text = time
        profileImg.image = UIImage(named: img)
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

       
        
        
        
        profileImg.layer.cornerRadius = profileImg.frame.size.height/2
        profileImg.layer.borderWidth = 2
        profileImg.layer.borderColor = UIColor.green.cgColor
        profileImg.layer.masksToBounds = true
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
