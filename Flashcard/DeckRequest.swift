//
//  DeckRequest.swift
//  Flashcard
//
//  Created by Vicki Yang on 12/13/20.
//

import Foundation

struct DeckRequest: Codable {
    var name: String
    var tag_ids: [Int]
    public var cards: [Card]
}
