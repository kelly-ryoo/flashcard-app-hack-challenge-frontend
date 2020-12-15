//
//  NetworkManager.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/3/20.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private static let getUserH = "https://flashcard-app-backend.herokuapp.com/users/"
    private static let postUserLoginH = "https://flashcard-app-backend.herokuapp.com/login/"
    private static let postUserH = "https://flashcard-app-backend.herokuapp.com/register/"
    private static let postDeck = "https://flashcard-app-backend.herokuapp.com/decks/"


    /*
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
 */
    
    
    //log in
    static func getUser(completion: @escaping (User) -> Void){
        let endpoint = getUserH
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
    
    static func postUserLogin(email: String, password: String, completion: @escaping (User) -> Void) {
        
        print(email)
        print(password)
     
     let parameters: Parameters = [
       "email" : email,
       "password" : password
     ]
             
        AF.request(postUserLoginH, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
    // AF.request(postUserLoginH, parameters: parameters).validate().responseJSON { response in
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
            /*
       switch response.result {
       case .success(let data):
            print("success logging in")
            completion()
       case .failure(let error):
            print(error.localizedDescription)
            completion()
       }
 */
     }
    }

    //sign up
    static func postUserSignUp(name: String, email: String, pass: String, completion: @escaping (User) -> Void) {
        print(email)
        print(pass)
        print(name)
     let parameters: Parameters = [
        "email" : email,
        "password": pass,
        "name" : name

     ]
        
        AF.request(postUserH, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
     //AF.request(postUserH, parameters: parameters).validate().responseJSON { response in
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
    
    static func postDeck(deckReq: DeckRequest, completion: @escaping (Deck) -> Void) {
     
        let parameters: Parameters = [
            "name": deckReq.name,
            "tag_ids": deckReq.tag_ids,
            "cards": deckReq.cards.map { $0.toDict() }
        ]
        
        let sessionT = User.current?.sessionToken
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(sessionT ?? "")",
            //"Accept": "application/json"
        ]
        
        AF.request(postDeck, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let deckData = try? jsonDecoder.decode(DeckDataResponse.self, from: data) {
                    let data = deckData.data
                    completion(data)
                }
            case .failure(let error):
                print(error.localizedDescription)
//                if "Session token expired" 
            }

     }
    }
    
}
