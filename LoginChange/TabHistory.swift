//
//  TabHistory.swift
//  LoginChange
//
//  Created by Rifluxyss on 25/09/24.
//

import UIKit

class TabHistory: UIViewController {

    
    @IBOutlet var historyTableView: UITableView!
    
    var storedArray: [String] = []
    
//    var jsonData = DataLoad().userData
    
    var names:[String] = []
    var times:[String] = []
    var dates:[String] = []
    var profileImages:[String]=[]
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if let users = loadJSONData() {
//            
//            storeUsersInUserDefaults(users: users)
//                }
//        
//        if let storedUsers = getUsersFromUserDefaults() {
//                    for user in storedUsers {
//  
//                    }
//                }
//    }
    
    
    
//        override func viewWillDisappear(_ animated: Bool) {
//            super.viewWillDisappear(animated)
//            navigationController?.setNavigationBarHidden(false, animated: animated)
//        }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        historyTableView.reloadData()
        if let array = UserDefaults.standard.array(forKey: "historyKey") as? [String] {
            storedArray.removeAll()
                    
                    for id in array {
                        if let index = storedArray.firstIndex(of: id){
                            storedArray.remove(at: index)
                        }
//                        storedArray.insert(id, at: 0)
                        storedArray.append(id)
                    }
            }
        print(storedArray)
        
//        names.removeAll()
//        times.removeAll()
//        dates.removeAll()
        
        for i in storedArray{
           
            if let filteredItem = filterItems(byID: i) {
                names.insert(filteredItem.name, at: 0)
                times.insert(filteredItem.time, at: 0)
                dates.insert(filteredItem.date, at: 0)
            }
        }
        
        func filterItems(byID id: String) -> UserData? {
            let items = loadJSONData()
                
            return items!.first { $0.id == id }
            
            
        }
        
        profileImages = ["pic1","pic2","pic3","pic4","pic5","pic6","pic7","pic7","pic1","pic2","pic3","pic4","pic5","pic6","pic7","pic8","pic1","pic1","pic2","pic3","pic4","pic5","pic6","pic7","pic7","pic1","pic2","pic3","pic4","pic5","pic6","pic7","pic8","pic1","pic1","pic2","pic3","pic4","pic5","pic6","pic7","pic7","pic1","pic2","pic3","pic4","pic5","pic6"]
        
        
        
    }
    

    
    

}

extension TabHistory:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HisCell", for: indexPath) as! TabHisTableCell
        
        cell.historyCell(name: names[indexPath.row], date: dates[indexPath.row], time: times[indexPath.row], img: profileImages[indexPath.row])
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
