//
//  TabBarChat.swift
//  LoginChange
//
//  Created by Rifluxyss on 24/09/24.
//

import UIKit

class TabBarChat: UIViewController {

    @IBOutlet var ChatTableView: UITableView!
    

    var names : [String] = []
    
    var dates :[String] = []
    var times :[String] = []
    var profileImages:[String]=[]
    
    override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
    
            navigationController?.setNavigationBarHidden(true, animated: animated)
    //            self.navigationItem.hidesBackButton = true
            }
    
//        override func viewWillDisappear(_ animated: Bool) {
//            super.viewWillDisappear(animated)
//            navigationController?.setNavigationBarHidden(false, animated: animated)
//        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let users = loadJSONData() {
            storeUsersInUserDefaults(users: users)
                }
        
        if let storedUsers = getUsersFromUserDefaults() {
                    for user in storedUsers {
                        
                        names.append(user.name)
                        dates.append(user.date)
                        times.append(user.time)
    
                    }
                }
        
        profileImages = ["pic1","pic2","pic3","pic4","pic5","pic6","pic7","pic7","pic1","pic2","pic3","pic4","pic5","pic6","pic7","pic8","pic1","pic1","pic2","pic3","pic4","pic5","pic6","pic7","pic7","pic1","pic2","pic3","pic4","pic5","pic6","pic7","pic8","pic1","pic1","pic2","pic3","pic4","pic5","pic6","pic7","pic7","pic1","pic2","pic3","pic4","pic5","pic6"]
       
    }

    



}

extension TabBarChat:UITableViewDelegate,UITableViewDataSource{
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! TabBarChatTableCellTableViewCell
        
        cell.ChatCell(name: names[indexPath.row], date: dates[indexPath.row], time: times[indexPath.row],img: profileImages[indexPath.row])
        
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    
}
