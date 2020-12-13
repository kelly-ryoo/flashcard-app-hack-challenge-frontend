//
//  User.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/12/20.
//

import Foundation

struct User: Codable {
    var sessionToken: String
    var sessionExpiration: String
    var updateToken: String
    
    var id: Int
    var email: String
    var name: String
    var decks: [Deck] = []
}

struct UserDataResponse: Codable {
    var data: User
}

