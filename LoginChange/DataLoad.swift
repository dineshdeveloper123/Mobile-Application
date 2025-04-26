//
//  DataLoad.swift
//  LoginChange
//
//  Created by Rifluxyss on 17/09/24.
//

import Foundation

//public class DataLoad {
//    
//    var userData = [UserData]()
//    
//    init(){
//        loads()
//        sort()
//    }
//    
//    func loads(){
//        
//        if let fileLoaction = Bundle.main.url(forResource: "User_jsonData", withExtension: "json") {
//            
//            do {
//                let data = try Data(contentsOf: fileLoaction)
//                let dataFromJson = try JSONDecoder().decode([UserData].self, from: data)
//                
//                self.userData = dataFromJson
//            }catch{
//                print("==========",error)
//            }
//        }
//    }
//    
//    func sort(){
//        self.userData = self.userData.sorted(by: {$0.name < $1.name})
//    }
//}


func loadJSONData() -> [UserData]? {
    let url = Bundle.main.url(forResource: "User_jsonData", withExtension: "json")
    
    do {
        let data = try Data(contentsOf: url!)
        var users = try JSONDecoder().decode([UserData].self, from: data)
        users = users.sorted(by: {$0.name < $1.name})
        return users
    } catch {
        print("Error loading JSON data: \(error)")
        return nil
    }
}



func storeUsersInUserDefaults(users: [UserData]) {
    do {

        let data = try JSONEncoder().encode(users)
        UserDefaults.standard.set(data, forKey: "users")
    } catch {
        print("Error storing users: \(error)")
    }
}


func getUsersFromUserDefaults() -> [UserData]? {
    guard let data = UserDefaults.standard.data(forKey: "users") else { return nil }

    
    do {
        let users = try JSONDecoder().decode([UserData].self, from: data)
        
        return users
    } catch {
        print("Error decoding users: \(error)")
        return nil
    }
}

//var totalcount = 48
func deleteUserFromUserDefaults(user: UserData) {
    var users = getUsersFromUserDefaults() ?? []
    
    users.removeAll { $0.id == user.id }
    
//    totalcount = users.count
    storeUsersInUserDefaults(users: users)
}




//product


func loadProductJSON() -> [ProductDataJson]? {
    
    let url = Bundle.main.url(forResource: "productJson", withExtension: "json")

    do {
        let data = try Data(contentsOf: url!)
        let productData = try JSONDecoder().decode([ProductDataJson].self, from: data)
        return productData
    } catch {
        print("Failed to load JSON data: \(error)")
        return nil
    }
}
