//
//  Deck.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/3/20.
//

import Foundation

struct Deck: Codable {
    var id: Int
    var name: String
    var userId: Int
    var tags: [Int]
    public var cards: [Card]
    // flashcard is another class
    // flashcards is a list of flashcard
    // one flashcard has 1 term and 1 definition
}

struct DeckDataResponse: Codable {
    var data: Deck
}

//struct FlashcardSet: Codable {
//    var id: Int
//    var name: String
//    var cards: [Flashcard]
//}


/*
 add set button on main page
 - brings to new view controller with new set screen
 - set limit to how many terms someone can add
 
 */
