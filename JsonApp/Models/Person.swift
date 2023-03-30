//
//  Animes.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 20.03.2023.
//

import Foundation
struct User {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let phone: String
    let picture: Picture
    let nat: String
    
    
    
    init(value: [String: Any]){
        gender = value["gender"] as? String ?? ""
        
        let nameDict = value["name"] as? [String: String] ?? [:]
        name = Name(value: nameDict)
        
        let dictLocation = value["location"] as? [String: Any] ?? [:]
        location = Location(value: dictLocation)
        
        email = value["email"] as? String ?? ""
        
        phone = value["phone"] as? String ?? ""
        
        let dictPicture = value["picture"] as? [String: String] ?? [:]
        picture = Picture(value: dictPicture)
        
        nat = value["nat"] as? String ?? ""
    }
    
    
    static func getRandomUser(from value: Any) -> [User] {
        guard let value = value as? [String: Any] else { return [] }
        guard let result = value["results"] as? [[String: Any]] else { return [] }
        return result.map { User(value: $0) }
    }
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
    
    init(value: [String: String]) {
        large = value["large"] ?? ""
        medium = value["medium"] ?? ""
        thumbnail = value["thumbnail"] ?? ""
    }
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
    
    init(value: [String: String]) {
        title = value["title"] ?? ""
        first = value["first"] ?? ""
        last = value["last"] ?? ""
    }
}

struct Location: Decodable {
    let street: Street
    let city: String
    let country: String
    
    init(value: [String: Any]) {
        let streetDict = value["street"] as? [String: Any] ?? [:]
        street = Street(value: streetDict)
        city = value["city"] as? String ?? ""
        country = value["country"] as? String ?? ""
        
    }
}

struct Street: Decodable {
    let number: Int
    let name: String
    
    init(value: [String: Any]) {
        number = value["number"] as? Int ?? 0
        name = value ["name"] as? String ?? ""
    }
}
