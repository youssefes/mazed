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


class API {
    
    
    // MARK : Register
    class func Register(CountryKey : String, Email : String, Password : String, UserName : String, PhoneNumber : String, img : Data?, complation : @escaping (_ status: Bool)->Void){
        
        guard  let Url = URL(string: "http://alyoum-api.mazadboutique.com/MazadLyom/api/Account/Register?CountryKey=\(CountryKey)&Email=\(Email)&Password=\(Password)&UserName=\(UserName)&PhoneNumber=\(PhoneNumber)") else{
            return
        }
        DispatchQueue.global(qos:.userInteractive).async {
            
            Alamofire.upload(multipartFormData: { (form : MultipartFormData) in
                DispatchQueue.main.async {
                    if let image = img {
                        form.append(image, withName: "img", fileName: "photo.jpeg", mimeType: "image/jpeg")
                    }
                }
                
            }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: Url, method: .post, headers: nil) { (reselt : SessionManager.MultipartFormDataEncodingResult) in
                switch reselt{
                case .failure(let error):
                    complation(false)
                    print(error)
                case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                    upload.uploadProgress(closure: { (progress) in
                        print(progress)
                    }).responseJSON(completionHandler: { (respond) in
                        
                        switch respond.result{
                        case .failure(let error):
                            print(" the is an error ->\(error)")
                        case .success(let value):
                            
                            
                            let json = JSON(value)
                            print(json)
                            complation(true)
                            
                        }
                    })
                }
            }
            
        }
        
    }
    
    // MARK : GetMyAuctions
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
//                    let Id = json["Id"].int
//                    let Name = json["Name"].string
//                    let AuctionPriceToNow = json["AuctionPriceToNow"].int
//                    let BaseImage = json["BaseImage"].string
//                    let CreateDateTime = json["CreateDateTime"].string
                    
                    complation(true)
                }
        }
    }
    
    
    // MARK : GEtFavorite
    
    class func getFavorite(skip : String, take : String, token : String, Complation: @escaping (_ status : Bool, _ data : [Favouriet]?) ->Void){
        
        
        guard let Url = URL(string: "http://alyoum-api.mazadboutique.com/MazadLyom/api/ProductsFovorite/GetFovorites?skip=\(skip)&take=\(take)") else{
            return
        }
        
        let header : HTTPHeaders = [
            
            "Authorization" : "Bearer \(token)"
        ]
        
        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (respond) in
            switch respond.result{
            case .failure(let error):
                print(error)
                Complation(false, nil)
            case .success(let value):
                let json = JSON(value)
                
                guard let data = json["Data"].array else{
                    Complation(false, nil)
                    return
                }
                var favoiretDataAr = [Favouriet]()
                for favoiretdata in data {
                    guard  let product = favoiretdata["Product"].dictionary else{
                        return
                    }
                    guard let name = product["Name"]?.stringValue else{
                        return
                    }
                    guard let image = product["BaseImage"]?.stringValue else{
                        return
                    }
                    
                    guard let date = favoiretdata["Date"].string else {
                        return
                    }
                    guard let time = favoiretdata["Time"].string else{
                        return
                    }
                    let favoritProdec = Favouriet.init(name: name, Date: date, image: image, time: time)
                    favoiretDataAr.append(favoritProdec)
                }
                Complation(true, favoiretDataAr)
                
            }
            
        }
    }
    
    // Mark : Notifications
    
    // http://alyoum-api.mazadboutique.com/MazadLyom/api/Notifications/GetNotifications?skip=0&take=10
    class func Notifications(skip : String, take : String, token: String ,  complation:@escaping (_ status: Bool, _ NotifacationDa : NotifacationData?)->Void){
        
        let header : HTTPHeaders = [
            "Authorization" : "Bearer \(token)"
        ]
        
        guard let Url = URL(string: "http://alyoum-api.mazadboutique.com/MazadLyom/api/Notifications/GetNotifications?skip=\(skip)&take=\(take)") else{
            return
        }
        
        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (respond) in
            switch respond.result{
            case .failure(let error):
                print(error)
                complation(false, nil)
            case .success(_ ):
                let data = respond.data
                
                do {
                    let Notifacations = try JSONDecoder().decode(NotifacationData.self, from: data!)
                    complation(true, Notifacations)
                    print(Notifacations)
                    
                }catch{
                    print(error)
                    complation(false,nil)
                }
                
            }
        }
    }
    
    
    // Mark : Contect_US
    class func Contect_us(email : String, message : String, isContect : Bool, Complatin : @escaping (_ status : Bool , _ Message : String?) -> Void){
        
        guard let url = URL(string: "http://alyoum-api.mazadboutique.com/MazadLyom/api/TechnicalSupport/PostTechnicalSupport?Message=\(message)&Email=\(email)IsContact=\(isContect)")else{
            return
        }
        
        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (respond) in
            switch respond.result{
            case .failure(let error):
                print(error)
                Complatin(false, nil)
            case .success(let value):
                let json = JSON(value)
                let massage = json["Message"].string
                Complatin(true, massage)
            }
        }
    }
}
