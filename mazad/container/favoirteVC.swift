//
//  favoirteVC.swift
//  mazad
//
//  Created by youssef on 4/3/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class favoirteVC: UIViewController {

    @IBOutlet weak var tableViewFavorite: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewFavorite.tableFooterView = UIView()
        tableViewFavorite.separatorInset = .zero
        tableViewFavorite.contentInset = .zero
        tableViewFavorite.delegate = self
        tableViewFavorite.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
    }
    
    @IBAction func bellByn(_ sender: UIButton) {
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

extension favoirteVC : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? favoriteCell{
            cell.selectionStyle = .none
            cell.ViewContainer.applyShadow()
            cell.viewImage.applyShadow()
            return cell
        }else{
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    
}

extension favoirteVC : UITableViewDelegate{
    
}
