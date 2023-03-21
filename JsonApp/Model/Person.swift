//
//  Animes.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 20.03.2023.
//

import Foundation
// Была проблема с тем что апи шлет разные типы данных то инт то стринг в одну строку,
// просто удалил ее, теперь все работает хорошо.
struct Person: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let phone: String
    let picture: Picture
    let nat: String
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct Login: Decodable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let coordinates: Coordinates
    let timezone: Timezone
}

struct Timezone: Decodable {
    let offset: String
    let description: String
}

struct Coordinates: Decodable {
    let latitude, longitude: String
}

struct Street: Decodable {
    let number: Int
    let name: String
}
