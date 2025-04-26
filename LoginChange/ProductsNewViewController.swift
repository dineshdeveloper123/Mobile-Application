//
//  ProductsNewViewController.swift
//  LoginChange
//
//  Created by Rifluxyss on 20/09/24.
//

import UIKit

//var ProductList = [ProductData(sectionType: "Laptops", productImg:["lap1","lap2","lap3","lap4"],itemName:["FirstLap","SecondLap","ThirdLap","FourthLap"])
//                   ,ProductData(sectionType: "Watchs", productImg: ["watch1","watch3","watch4","watch2"],itemName:["Firstwatch","Secondwatch","Thirdwatch","Fourthwatch"]),
//                   ProductData(sectionType: "Toys", productImg: ["toy1","toy2","toy3","toy4"],itemName: ["FirstToy","SecondToy","ThirdToy","FourthToy"]),
//                   ProductData(sectionType: "Mobiles", productImg: ["phone1","phone3","phone2","phone4"],itemName:["Firstphone","Secondphone","Thirdphone","Fourthphone"]),
//                   ProductData(sectionType: "Mens Shirt", productImg: ["pic1","pic3","pic4","pic5"],itemName:["FirstShirt","SecondShirt","ThirdShirt","FourthShirt"])]

//var ProductList = [ProductData(productImg:["lap1","lap2","lap3","lap4"])
//                   ,ProductData(productImg: ["watch1","watch3","watch4","watch2"]),
//                   ProductData(productImg: ["toy1","toy2","toy3","toy4"]),
//                   ProductData(productImg: ["phone1","phone3","phone2","phone4"]),
//                   ProductData(productImg: ["pic1","pic3","pic4","pic5"])]

var proData: [ProductDataJson] = loadProductJSON() ?? []

class ProductsNewViewController: UIViewController {

    @IBOutlet var MyTable: UITableView!

    var proData: [ProductDataJson] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        proData = loadProductJSON() ?? []
    }

}


extension ProductsNewViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return proData.count
    }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PTableViewCell
        cell.MyCollectionView.tag = indexPath.section
        cell.sectionData = proData[indexPath.section]
        cell.Mydelegate = self
        cell.MyCollectionView.reloadData()
        
//        MyTable.rowHeight = cell.MyCollectionView.collectionViewLayout.collectionViewContentSize.height+20
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return proData[section].sectionType
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .lightGray
        
    
    }
}

extension ProductsNewViewController: PTableViewCellDelegate {
    func didSelectProduct(proName: String, proImage: String, proPrize: String, proItemName: String, proWarranty: String, proReview: String, prodiscount:String, proDetails: String) {

       
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let productDetailsVC = storyboard?.instantiateViewController(withIdentifier: "ProductDetails") as? ProductDetails {
            
            productDetailsVC.proName = proName
            productDetailsVC.proImage = proImage
            productDetailsVC.proPrize = proPrize
            productDetailsVC.proItemName = proItemName
            productDetailsVC.proReview = proReview
            productDetailsVC.proWarranty = proWarranty
            productDetailsVC.prodiscount = prodiscount
            productDetailsVC.proDetails = proDetails
            
            self.navigationController?.pushViewController(productDetailsVC, animated: true)
        }
    }
}
