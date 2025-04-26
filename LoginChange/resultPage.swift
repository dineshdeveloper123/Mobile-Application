//
//  resultPage.swift
//  LoginChange
//
//  Created by Rifluxyss on 13/09/24.
//

import UIKit

class resultPage: UIViewController, UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet var dataLabel: UILabel!

    var username = ""
    
    @IBOutlet var userSearch: UISearchBar!
    
    @IBOutlet var table: UITableView!
    
    var textViewKey = "name"
    
    var names = [String]()
    var mobileNums = [String]()
    var city = [String]()
    var email = [String]()
    var roles = [String]()
    var ids = [String()]
    
    var searchName = [String]()
    var searching = false
    
    var itemm:Any = ()
    
    var searchInx:Int = 0
    
    var expandedcell:IndexSet = []
    
//    let jsondata = DataLoad().userData
    var users: [UserData] = []
       
    
    override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
    
            navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
        if let storedUsers = getUsersFromUserDefaults() {
                    users = storedUsers
                }
        names.removeAll()
        mobileNums.removeAll()
        roles.removeAll()
        city.removeAll()
        email.removeAll()
        ids.removeAll()
        
        for user in users {
            names.append(user.name)
            mobileNums.append(user.mobile)
            city.append(user.city)
            email.append(user.email)
            roles.append(user.role)
            ids.append(user.id)
        }
        
    //            self.navigationItem.hidesBackButton = true
            }
    
//        override func viewWillDisappear(_ animated: Bool) {
//            super.viewWillDisappear(animated)
//            navigationController?.setNavigationBarHidden(false, animated: animated)
//        }
        
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let storedUsers = getUsersFromUserDefaults() {
//                    users = storedUsers
//                }
        
//        if let users = loadJSONData() {
//            storeUsersInUserDefaults(users: users)
//                }
        
//        if let storedUsers = getUsersFromUserDefaults() {
//                    for user in users {
//                        
//                        names.append(user.name)
//                        mobileNums.append(user.mobile)
//                        city.append(user.city)
//                        email.append(user.email)
//                        roles.append(user.role)
//                        ids.append(user.id)
//                    }
//                }
        
        if let savedText = UserDefaults.standard.string(forKey: textViewKey) {
            dataLabel.text = "WelCome \(savedText)"
        }
  
        
//        names = jsondata.map({$0.name})
//        
//        mobileNums = jsondata.map({$0.mobile})
//        city = jsondata.map({$0.city})
//        email = jsondata.map({$0.email})
//        roles = jsondata.map({$0.role})
        

        dataLabel.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.dataLabel.alpha = 1
        }

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 0.3, animations: {
                self.dataLabel.alpha = 0
            }) { _ in
                self.dataLabel.removeFromSuperview()
            
            }
        }
        

    }
    
    @IBAction func logOutBtnTapp(_ sender: UIButton) {
        
        let alert = UIAlertController(title: nil, message: "Logout", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Yes", style: .destructive) { (action) in  self.navigationController?.popToRootViewController(animated: true)
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert,animated: true, completion: nil)
       
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching {
            return searchName.count
        }else{
            
            return users.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BtnClass
        
//                let item = jsondata[indexPath.row]
//                cell.configureCell(name: item.name, phone: item.mobile)

        
        if searching {
   
            cell?.configureCell(name:searchName[indexPath.row],phone: mobileNums[indexPath.row],city:city[indexPath.row], email: email[indexPath.row], role: roles[indexPath.row])
            
            if expandedcell.contains(indexPath.row){
                cell?.roleLbl.isHidden = false
                cell?.emailLbl.isHidden = false
                cell?.cityLbl.isHidden = false
                
            }else{
                cell?.roleLbl.isHidden = true
                cell?.emailLbl.isHidden = true
                cell?.cityLbl.isHidden = true
            }
            
            cell?.buttonClicked = {
                if self.expandedcell.contains(indexPath.row){
                    self.expandedcell.remove(indexPath.row)
                    
                }else{
                    self.expandedcell.insert(indexPath.row)
                    
                }
                print(indexPath.row)
                tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
            
        }
        else {
            cell?.configureCell(name:names[indexPath.row],phone: mobileNums[indexPath.row],city:city[indexPath.row], email: email[indexPath.row], role: roles[indexPath.row])
//            print(indexPath.row)
            
            if expandedcell.contains(indexPath.row){
                cell?.roleLbl.isHidden = false
                cell?.emailLbl.isHidden = false
                cell?.cityLbl.isHidden = false
                
            }else{
                cell?.roleLbl.isHidden = true
                cell?.emailLbl.isHidden = true
                cell?.cityLbl.isHidden = true
            }
            
            cell?.buttonClicked = {
                if self.expandedcell.contains(indexPath.row){
                    self.expandedcell.remove(indexPath.row)
                    
                }else{
                    self.expandedcell.insert(indexPath.row)
                    
                }
                print(indexPath.row)
                tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
            
        }

        return cell!
    }
    
   
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if !searching{

            let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in /*self.names.remove(at: indexPath.row)*/
                
                let alert = UIAlertController(title: nil, message: "Delete", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Yes", style: .destructive) { (action) in
                    
                    let userToDelete = self.users[indexPath.row]
                    self.deleteUserFromUserDefaults(user: userToDelete)
                    self.users.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                    completionHandler(true)
                    
                }
                let cancel = UIAlertAction(title: "Cancel", style: .cancel)
                
                alert.addAction(action)
                alert.addAction(cancel)
                self.present(alert,animated: true, completion: nil)
                
                
                //            tableView.deleteRows(at: [indexPath], with: .automatic)
                
            }
            
            delete.image = UIImage(systemName: "trash")
            return UISwipeActionsConfiguration(actions: [delete])
            
        }
        return UISwipeActionsConfiguration()
    }
    
    func deleteUserFromUserDefaults(user: UserData) {
        var usersD = getUsersFromUserDefaults() ?? []
        
        usersD.removeAll { $0.id == user.id }
        
    //    totalcount = users.count
//        storeUsersInUserDefaults(users: users)
        users = getUsersFromUserDefaults() ?? []
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let call = UIContextualAction(style: .normal, title: "Call"){(action, view, completionHandler) in print("Call")
            
            let phoneNumber = self.mobileNums[indexPath.row]
//                       if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
//                           UIApplication.shared.open(url)
//                       } else {
//                           print("Invalid")
//                       }
//            completionHandler(true)
            
            if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(phoneCallURL)) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                }
              }
            
//        let calling = calling()
//            let id = UUID()
//            calling.StartCall(id:id, handle:"Dinsh")
        }
        call.backgroundColor = .blue
        call.image = UIImage(systemName: "phone")
        return UISwipeActionsConfiguration(actions: [call])
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        if searching{
            let test = searchName[indexPath.row]
            searchInx = names.firstIndex(of: test)!
            
            itemm = users[searchInx]

        }
        else{
            users = getUsersFromUserDefaults() ?? []
            
            itemm = users[indexPath.row]
            print(itemm)
//            itemm = getUsersFromUserDefaults()
            
            }
            
        if let detailsVC = storyboard?.instantiateViewController(withIdentifier: "detailPageViewController") as? detailPageViewController {
                
                detailsVC.item = (itemm as! UserData)
                navigationController?.pushViewController(detailsVC, animated: true)
        }

    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}
   

extension resultPage : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchName = names.filter({$0.prefix(searchText.count) == searchText})
   
        searching = true
        table.reloadData()
    }
    
}

