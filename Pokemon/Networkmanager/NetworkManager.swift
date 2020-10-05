//
//  NetworkManager.swift
//  Pokemon
//
//  Created by Ghassan  albakuaa  on 10/4/20.
//

import UIKit

let url = "https://pokeapi.co/api/v2/pokemon"
let pBaseUrl = "https://pokeapi.co/api/v2/pokemon/"

typealias PokemonHandler = (Result<Results, NetworkError>) -> ()
typealias OnePokemonHandler = (Result<Sprites, NetworkError>) -> ()


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    var session: URLSession
    var decoder: JSONDecoder
    
    private init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
}

extension NetworkManager {
    
    func fetchPokemon(completion: @escaping PokemonHandler) {
        

        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        
        self.session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            
            do {
                let list = try self.decoder.decode(Results.self, from: data)
                //completion(.success(list))
                completion(.success(list))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodeError))
            }
            
        }.resume()
        
    }
    
    func fetchOnePokemon(pokeName: String, completion: @escaping OnePokemonHandler) {
        
        guard let url = URL(string: pBaseUrl + pokeName) else {
            completion(.failure(.badURL))
            return
        }
        
        self.session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            
            
            do {
                let sprites = try self.decoder.decode(Sprites.self, from: data)
                print("sprites")
                completion(.success(sprites))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodeError))
            }
            
        }.resume()
        
    }
    
}


