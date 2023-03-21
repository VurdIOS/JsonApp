//
//  ViewController.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 20.03.2023.
//

import UIKit

class GetPersonViewController: UIViewController {
    
    private let urlPersonRequest = "https://randomuser.me/api/"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPerson()
    }
    
    private func fetchPerson() {
        guard let url = URL(string: urlPersonRequest) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let person = try decoder.decode(Person.self, from: data)
                print(person)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

