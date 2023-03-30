//
//  FavoriteListControllerTableViewController.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 25.03.2023.
//

import UIKit

class FavoriteListController: UITableViewController {
    
    var favoritePersonList = favoriteList
    let personModel = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritePersonCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        content.imageProperties.cornerRadius = 50
        
        let person = favoriteList[indexPath.row]
        let pers = person[0]
        
        content.text = "\(pers.name.first) \(pers.name.last)"
        content.secondaryText = pers.location.country
        
        personModel.fetchPersonData(from: pers.picture.medium) { result in
            switch result {
            case .success(let imageData):
                content.image = UIImage(data: imageData)
                cell.contentConfiguration = content
            case .failure(let error):
                print(error)
            }
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}



