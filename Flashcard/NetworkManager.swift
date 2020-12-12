//
//  NetworkManager.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/3/20.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private static let host = "https://flashcard-app-backend.herokuapp.com/decks/"
    
    static func getFlashcardSets(completion: @escaping ([Deck]) -> Void) {
        let endpoint = host
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let flashcardsData = try? jsonDecoder.decode(DeckDataResponse.self, from: data) {
                    // Instructions: Use completion to handle response
                    let deck = flashcardsData.data
                    completion(deck)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
