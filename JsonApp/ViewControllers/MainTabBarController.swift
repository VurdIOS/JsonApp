//
//  TabBarControllerViewController.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 25.03.2023.
//
import UIKit

class MainTabBarController: UITabBarController {
    
    let personModel = NetworkManager.shared
    var randomPerson: [Person] = []
    var favoriteList: [[Person]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
   


    
}
