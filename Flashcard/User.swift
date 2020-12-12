//
//  User.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/12/20.
//

import Foundation

struct User: Codable {
    var email: String
    var name: String
    var password: String
}

struct UserDataResponse: Codable {
    var data: [User]
}

