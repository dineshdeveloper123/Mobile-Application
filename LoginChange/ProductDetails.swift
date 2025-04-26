//
//  ProductDetails.swift
//  LoginChange
//
//  Created by Rifluxyss on 23/09/24.
//

import UIKit

class ProductDetails: UIViewController {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var productImg: UIImageView!
    @IBOutlet var prize: UILabel!
    @IBOutlet var itemName: UILabel!
    @IBOutlet var warranty: UILabel!
    @IBOutlet var review: UILabel!
    @IBOutlet var discount: UILabel!
    @IBOutlet var details: UILabel!
    
    var proName: String = ""
    var proImage:String = ""
    var proPrize:String = ""
    var proItemName:String = ""
    var proWarranty:String = ""
    var proReview:String = ""
    var prodiscount:String = ""
    var proDetails:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        func selectedItems(proName: String,proImage:String,proPrize:String,proItemName:String,proWarranty:String,proReview:String,proDetails:String){
            
            titleLbl.text = proName
            productImg.image = UIImage(named: proImage)
            prize.text = "Price : \(proPrize)"
            itemName.text = proItemName
            warranty.text = proWarranty
            review.text = proReview
        discount.text = prodiscount
            details.text = proDetails
        
        productImg.layer.cornerRadius = 22
        
//        if let itemName = item {
//            titleLbl.text = itemName
//            
//        }
    }

}
