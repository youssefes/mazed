//
//  API.swift
//  mazad
//
//  Created by youssef on 4/4/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire



/*{
    "Id": 10,
    "Name": "يبيب",
    "Description": "سبسبسب",
    "MinimumPriceForOpen": 0,
    "MinimumPriceForBid": 0,
    "AuctionPriceToNow": 0,
    "BiddersCount": 0,
    "Files": [
    {
    "AlbumFileId": 93,
    "State": 0,
    "FileUrl": "http://alyoum-cp.mazadboutique.com/Files/Images/DREAM.jpg1375830307.jpg",
    "FileUpload": null,
    "IsVideo": false
    }
    ],
    "BaseImage": "http://alyoum-cp.mazadboutique.com/Files/Images/DREAM.jpg1375830307.jpg",
    "IsFinshed": true,
    "IsStarted": true,
    "Timer": {
        "Days": -34,
        "Hours": -18,
        "Minutes": -3,
        "Seconds": -8,
        "StartIn": "27/02/2019 10:10:14 AM",
        "EndIn": "28/02/2019 10:10:14 AM"
    },
    "IsFollowing": false,
    "IsFavorite": false,
    "CreateBy": {
        "Id": 1,
        "UserName": "ahmed",
        "FullName": "ahmed Nageeb Mahmoud",
        "Serial": "ahmed1",
        "CountryName": "الكويت",
        "Province": {
            "Id": 6,
            "Name": "مقاطعة 1"
        },
        "Phone": null,
        "ImageUrl": "http://alyoum-cp.mazadboutique.com/Files/Images/Users/Profile/team3.jpg1162494133.jpg"
    },
    "CreateDateTime": "27/02/2019 10:10:14 AM",
    "EndDateTime": "28/02/2019 10:10:14 AM",
    "StartDateTime": "27/02/2019 10:10:14 AM"
},
*/
class API {
    class func GetMyAuctions(skip : String ,take : String , UserId :String, complation : @escaping (_ status :Bool)->Void){
        
        guard let Url = URL(string: "http://alyoum-api.mazadboutique.com/MazadLyom/api/Auctions/GetUserAuctions?skip=\(skip)&take=\(take)&userId=\(UserId)") else{
            return
        }
        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default
            , headers: nil).responseJSON { (respond) in
                switch respond.result{
                case .failure(let error):
                    print(error)
                    complation(false)
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    complation(true)
                }
        }
    }
}
