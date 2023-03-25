//
//  TabBarControllerViewController.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 25.03.2023.
//

// Проблема в следующем
// Он выдает ошибку как только я его подключаю к NavigationBar
//2023-03-25 21:47:41.355504+0300 JsonApp[11389:287344] [Assert] UINavigationBar decoded as unlocked for UINavigationController, or navigationBar delegate set up incorrectly. Inconsistent configuration may cause problems. navigationController=<JsonApp.NavigationViewController: 0x15d017200>, navigationBar=<UINavigationBar: 0x15c50ac00; frame = (0 0; 0 50); opaque = NO; autoresize = W; layer = <CALayer: 0x600000d20ca0>> delegate=0x15d017200
//и ничего не делает, как бы просто предупреждение, но он ничего никуда не передает
// Ниже я закоммитил код с которым пытался работать.









import UIKit

class TabBarControllerController: UITabBarController {
    //
    //    let personModel = NetworkManager.shared
    //    var randomPerson: [Person]!
    //
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        getPerson()
    //    }
    //
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        viewControllers?.forEach({ viewController in
    //            if let searchVC = viewController as? PersonShowingViewController {
    //                searchVC.randomPersonForTestOnView = randomPerson
    //            } else if let favoriteVC = viewController as? FavoriteListControllerTableViewController {
    //                favoriteVC.randomPersonForTestOnList = randomPerson
    //            }
    //        })
    //    }
    //
    //
    //    func getPerson() {
    //        personModel.fetchPerson(from: Link.api.url) { [weak self] result in
    //            switch result {
    //            case .success(let person):
    //                print(person)
    //                self?.randomPerson = person.results
    //            case .failure(let error):
    //                print(error)
    //            }
    //        }
    //    }
    //
    //}
    
}
