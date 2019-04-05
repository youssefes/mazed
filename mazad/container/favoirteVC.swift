//
//  favoirteVC.swift
//  mazad
//
//  Created by youssef on 4/3/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit
import Kingfisher

class favoirteVC: UIViewController {

    @IBOutlet weak var tableViewFavorite: UITableView!
    
    var dataFav = [Favouriet]()
    override func viewDidLoad() {
        super.viewDidLoad()
 
       
        tableViewFavorite.tableFooterView = UIView()
        tableViewFavorite.separatorInset = .zero
        tableViewFavorite.contentInset = .zero
        tableViewFavorite.delegate = self
        tableViewFavorite.dataSource = self

         handelData()
        // Do any additional setup after loading the view.
    }
    

    func handelData(){
    
        let Token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIiLCJyb2xlIjoiY2xpZW50IiwiVXNlcklkIjoiMTkiLCJuYmYiOjE1NTI3NTg2MDQsImV4cCI6MTU1NjIxNDYwNCwiaWF0IjoxNTUyNzU4NjA0LCJpc3MiOiJNYXphZCIsImF1ZCI6Ik1hemFkIn0.0XGKEQf-jjHW1ohcrugNvpp8kIIwfKsNJJ5tEcD1R3Q"
        
        API.getFavorite(skip: "0", take: "10", token: Token) { (status, data) in
            if status {
                print("Done")
                
                if let datafa = data {
                    self.dataFav = datafa
                    self.tableViewFavorite.reloadData()
                }
            }
        }
    
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
        return dataFav.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? favoriteCell{
            
            let image = dataFav[indexPath.row].image
            let UrlImage = URL(string: image)
            cell.imageFavoirt.kf.indicatorType = .activity
            cell.imageFavoirt.kf.setImage(with: UrlImage)
            cell.selectionStyle = .none
            cell.namelbl.text = dataFav[indexPath.row].name
            cell.Datelbl.text = dataFav[indexPath.row].Date
            cell.timeLbl.text = dataFav[indexPath.row].time
            
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
