//
//  FavoiretModel.swift
//  mazad
//
//  Created by youssef on 4/5/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation
struct Favouriet {
    var name : String?
    var Date : String
    var image : String
    var time : String
}


struct NotifacationData : Codable {
    var Data : [DataNotif]?
}

struct DataNotif : Codable{
    var DateTime: String?
    var Title : String?
    var NotifyId : Int?
    var Target : target?
  
    
}

struct target : Codable {
    var Name : String?
    var Price : Int?
    var Image :String?
    var Id : Int?
    var Description : String
    var IsAuction : Bool?
    var IsProduct :Bool?
    var IsFavorite : Bool?

}

