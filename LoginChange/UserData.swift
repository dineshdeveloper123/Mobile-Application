//
//  UserData.swift
//  LoginChange
//
//  Created by Rifluxyss on 17/09/24.
//

import Foundation



struct UserData : Codable{
    
    var id:String
    var name: String
    var qualification:String
    var role:String
    var gender:String
    var age:String
    var city:String
    var state:String
    var mobile:String
    var interested:String
    var url:String
    var webUrl:String
    var date:String
    var time:String
    var email:String
    
}

// product

struct ProductDataJson: Codable {
    let id: String
    let sectionType:String
    let products: [Product]
}

struct Product: Codable {
    let itemName: String
    let photo:String
    let price: String
    let review: String
    let warranty: String
    let discount: String
    let about: String
}
