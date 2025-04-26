//
//  TabHisTableCell.swift
//  LoginChange
//
//  Created by Rifluxyss on 25/09/24.
//

import UIKit

class TabHisTableCell: UITableViewCell {

    @IBOutlet var hisImg: UIImageView!
    @IBOutlet var hisName: UILabel!
    @IBOutlet var hisTime: UILabel!
    @IBOutlet var hisDate: UILabel!
    
    func historyCell(name: String,date:String,time:String,img:String) {
        
        hisName.text = name
        hisTime.text = time
        hisDate.text = date
        hisImg.image = UIImage(named: img)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        hisImg.layer.cornerRadius = hisImg.frame.size.height/2
        hisImg.layer.borderWidth = 2
        hisImg.layer.borderColor = UIColor.red.cgColor
//        hisImg.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
