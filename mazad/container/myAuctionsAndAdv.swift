//
//  myAuctionsAndAdv.swift
//  mazad
//
//  Created by youssef on 4/4/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class myAuctionsAndAdv: UIViewController {

    @IBOutlet weak var tableViewMyAcutions: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewMyAcutions.tableFooterView = UIView()
        tableViewMyAcutions.separatorInset = .zero
        tableViewMyAcutions.contentInset = .zero
        tableViewMyAcutions.delegate = self
        tableViewMyAcutions.dataSource = self
        handelData()
    }
    
    func handelData(){
        API.GetMyAuctions(skip: "1", take: "5", UserId: "1") { (ststus) in
            if ststus{
                print("done")
            }
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
    }
    
    @IBAction func ballBtn(_ sender: Any) {
    }
    
}
extension myAuctionsAndAdv : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyAcutionscell", for: indexPath) as? MyAcutions{
            cell.selectionStyle = .none
            return cell
        }else{
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

extension myAuctionsAndAdv : UITableViewDelegate{
    
}

