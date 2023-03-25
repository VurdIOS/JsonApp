//
//  NetworkManager.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 23.03.2023.
//

import Foundation
enum Link {
    case api
    
    var url: URL {
        switch self {
        case .api:
            return URL(string: "https://randomuser.me/api/")!
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init () {}
    
    
    
    func fetchPerson (from url: URL, completion: @escaping(Result<RandomPerson, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let person = try decoder.decode(RandomPerson.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(person))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchPersonImage(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
}
