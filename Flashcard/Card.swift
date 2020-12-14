//
//  Card.swift
//  Flashcard
//
//  Created by Vicki Yang on 12/11/20.
//

import Foundation

struct Card: Codable {
    var front: String
    var back: String
    
    func toDict() -> [String: String] {
            return ["front": front ?? "", "back": back ?? ""]
        }
}

//struct CardDataResponse: Codable {
//    data
//}
