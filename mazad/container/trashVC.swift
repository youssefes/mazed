//
//  trashVC.swift
//  mazad
//
//  Created by youssef on 4/3/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class trashVC: UIViewController {

    @IBOutlet weak var tableViewTrach: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewTrach.tableFooterView = UIView()
        tableViewTrach.separatorInset = .zero
        tableViewTrach.contentInset = .zero
        tableViewTrach.delegate = self
        tableViewTrach.dataSource = self
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension trashVC : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "trachcell", for: indexPath) as? trachcell{
            cell.selectionStyle = .none
            cell.containerView.applyShadow()
            cell.imageVie.applyShadow()
            return cell
        }else{
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    
}

extension trashVC : UITableViewDelegate{
    
}

