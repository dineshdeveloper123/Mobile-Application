//
//  PTableViewCell.swift
//  LoginChange
//
//  Created by Rifluxyss on 20/09/24.
//

import UIKit

protocol PTableViewCellDelegate: AnyObject {
    func didSelectProduct(proName: String,proImage:String,proPrize:String,proItemName:String,proWarranty:String,proReview:String,prodiscount:String, proDetails:String)
}


class PTableViewCell: UITableViewCell {

    @IBOutlet var MyCollectionView: UICollectionView!
    var sectionData: ProductDataJson?
    
    var Mydelegate: PTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        MyCollectionView.dataSource = self
        MyCollectionView.delegate = self
//        MyCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    

}
extension PTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return ProductList[MyCollectionView.tag].productImg.count
        return sectionData?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! PCollectionViewCell
        
        
        let product = sectionData?.products[indexPath.row]
        cell.myImg.image = UIImage(named:product!.photo)
        cell.nameLbl.text = product?.itemName
        
        return cell
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        print("Selected",ProductList[MyCollectionView.tag].itemName[indexPath.row])
        
        let selectedProduct = sectionData?.products[indexPath.row]
        let selectedName = selectedProduct?.itemName
//        print("selectedName",selectedName)
        let selectedImg = selectedProduct?.photo
        
        Mydelegate?.didSelectProduct(proName: selectedName!, proImage: selectedImg!, proPrize: selectedProduct!.price, proItemName: selectedProduct!.itemName, proWarranty: selectedProduct!.warranty, proReview: selectedProduct!.review, prodiscount: selectedProduct!.discount, proDetails: selectedProduct!.about)

    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 180.0, height: 220.0)
//    }
//    

}
