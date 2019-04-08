//
//  NotifacationsVC.swift
//  mazad
//
//  Created by youssef on 4/1/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class NotifacationsVC: UIViewController {

    var notifitionArray = [DataNotif]()
    @IBOutlet weak var tableViewContainer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewContainer.tableFooterView = UIView()
        tableViewContainer.separatorInset = .zero
        tableViewContainer.contentInset = .zero
        tableViewContainer.delegate = self
        tableViewContainer.dataSource = self
        HandelData()
        // Do any additional setup after loading the view.
    }
    
    func HandelData(){
        
        let Token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIiLCJyb2xlIjoiY2xpZW50IiwiVXNlcklkIjoiMTkiLCJuYmYiOjE1NTI3NTg2MDQsImV4cCI6MTU1NjIxNDYwNCwiaWF0IjoxNTUyNzU4NjA0LCJpc3MiOiJNYXphZCIsImF1ZCI6Ik1hemFkIn0.0XGKEQf-jjHW1ohcrugNvpp8kIIwfKsNJJ5tEcD1R3Q"
        
        API.Notifications(skip: "0", take: "10", token: Token) { (status,notifacations) in
            if status{
                
                guard let notifacation = notifacations else{
                    return
                }
                guard let notifyData  = notifacation.Data else{
                    return
                }
                
                self.notifitionArray = notifyData
                self.tableViewContainer.reloadData()
                print("Done")
            }
        }
    }
    
    @IBAction func bellBtnAction(_ sender: Any) {
    }
    
   
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
extension NotifacationsVC : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifitionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as?NotificationCell{
            let notifyData = notifitionArray[indexPath.row]
            if let price = notifyData.Target?.Price{
                 cell.pricelbl.text = "\(price)"
            }
            if let Image = notifyData.Target?.Image {
                let urlImage = URL(string: Image)
                cell.imagecare.kf.indicatorType = .activity
                cell.imagecare.kf.setImage(with: urlImage)
            }
            
            cell.selectionStyle = .none
            let Date = notifyData.DateTime
            if  let date = Date?.prefix(11) {
                cell.dateTime.text = "\(date)"
            }
            
            if let Time = Date?.suffix(12){
                cell.timelbl.text = "\(Time)"
                cell.timeONView.text = "\(Time)"
            }
            
            if (notifyData.Target?.IsAuction)! {
                cell.mozudelbl.text = "مزايدة"
            }else{
                cell.mozudelbl.text = "منتج"
            }
            
            cell.carName.text = notifyData.Title
            cell.ViewContainer.applyShadow()
            cell.ViewOFImage.applyShadow()
            return cell
        }else{
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    
}

extension NotifacationsVC : UITableViewDelegate{
    
}
