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
    private static let hostUser = "https://flashcard-app-backend.herokuapp.com/users/1"
    private static let postUser = "https://flashcard-app-backend.herokuapp.com/users/"

    
    static func getFlashcardSets(completion: @escaping ([Deck]) -> Void) {
        let endpoint = host
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let flashcardsData = try? jsonDecoder.decode(DeckDataResponse.self, from: data) {
                    let deck = flashcardsData.data
                    completion(deck)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    //log in
    static func getUser(completion: @escaping ([User]) -> Void){
        let endpoint = host
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let userData = try? jsonDecoder.decode(UserDataResponse.self, from: data) {
                    let data = userData.data
                    completion(data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    //sign up
    static func postUser(name: String, email: String, pass: String) {
     
     let parameters: Parameters = [
       "username" : email,
       "name" : name
     ]
             
     AF.request(postUser, parameters: parameters).validate().responseJSON { response in
       switch response.result {
       case .success(let data):
            print("success")
       case .failure(let error):
            print(error.localizedDescription)
       }
     }
    }
    
    
    
}
