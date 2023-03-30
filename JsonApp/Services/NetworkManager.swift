//
//  NetworkManager.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 23.03.2023.
//

import Foundation
import Alamofire

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

    func fetchPerson (completion: @escaping(Result<[User], AFError>) -> Void) {
        AF.request(Link.api.url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let users = User.getRandomUser(from: value)
                    completion(.success(users))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchPersonData(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
