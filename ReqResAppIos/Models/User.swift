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
    let avatar: URL?
    
    static let example = User(
        id: 2,
        firstName: "Jane",
        lastName: "Flower",
        avatar: URL(string: "https://reqres.in/img/faces/1-image.jpg")!)
    
    init(id: Int, firstName: String, lastName: String, avatar: URL? = nil) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
    }
    
    init(postUserQuery: PostUserQuery) {
        self.id = 0
        self.firstName = postUserQuery.firstName
        self.lastName = postUserQuery.lastName
        self.avatar = nil
    }
}

struct UsersQuery: Decodable {
    let data: [User]
}

struct PostUserQuery: Codable {
//    let name: String
//    let job: String
    
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "name"
        case lastName = "job"
    }
}
