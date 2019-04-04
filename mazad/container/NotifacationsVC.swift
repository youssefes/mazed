//
//  NotifacationsVC.swift
//  mazad
//
//  Created by youssef on 4/1/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class NotifacationsVC: UIViewController {

    @IBOutlet weak var tableViewContainer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewContainer.tableFooterView = UIView()
        tableViewContainer.separatorInset = .zero
        tableViewContainer.contentInset = .zero
        tableViewContainer.delegate = self
        tableViewContainer.dataSource = self
        // Do any additional setup after loading the view.
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as?NotificationCell{
             cell.selectionStyle = .none
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
