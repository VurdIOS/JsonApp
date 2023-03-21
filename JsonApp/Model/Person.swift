//
//  Animes.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 20.03.2023.
//

import Foundation
// АЛЕКСЕЙ, ЕСЛИ НЕ СПАРСИТСЯ С ПЕРВОГО РАЗА, ЭТО ПРОБЛЕМА АПИ, ОНА ИНОГДА РАЗНЫЕ ДАННЫЕ ШЛЕТ
// НИЖЕ ОТМЕТИЛ КУДА, ЧТО ПРИХОДИТ
// Просто перезапустите пару раз
struct Person: Decodable {
    let results: [Result]
    let info: Info
}

struct Info: Decodable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}

struct Result: Decodable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone: String
    let cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct ID: Decodable {
    let name: String
    let value: String? // Сюда иногда прилетает Null/Nill, поэтому поставил опционал
}

struct Dob: Decodable {
    let date: String
    let age: Int
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
    let postcode: Int // Сюда иногда прилетает String, но чаще Int
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
