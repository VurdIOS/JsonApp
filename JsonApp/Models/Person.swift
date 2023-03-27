//
//  Animes.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 20.03.2023.
//

import Foundation
struct RandomPerson: Decodable {
    let results: [Person]
}

struct Person: Decodable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let phone: String
    let picture: Picture
    let nat: String
    var fullName: String {
        "\(name.first) \(name.last)"
    }
}

struct Picture: Decodable {
    let large: URL
    let medium: URL
    let thumbnail: URL
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable {
    let street: Street
    let city: String
    let country: String

}

struct Street: Decodable {
    let number: Int
    let name: String
}
