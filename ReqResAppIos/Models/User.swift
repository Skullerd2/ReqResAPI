//
//  main.swift
//  ReqResApp
//
//  Created by Vadim on 22.07.2024.
//

import Foundation

struct User: Decodable{
    let id: Int
    let firstName: String
    let lastName: String
    let avatar: URL
    
    static let example = User(
        id: 2,
        firstName: "Jane",
        lastName: "Flower",
        avatar: URL(string: "https://reqres.in/img/faces/1-image.jpg")!)
}

struct UsersQuery: Decodable {
    let data: [User]
}
