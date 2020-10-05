//
//  Poke.swift
//  Pokemon
//
//  Created by Ghassan  albakuaa  on 10/4/20.
//

class Results: Codable {
    var results: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

class Pokemon: Codable {
    var name: String?
    var url: String?
    
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
    
}

class Sprites: Codable {
    var data: [String: String]
    
    init(data: [String:String]) {
        self.data = data
    }
    
    enum CodingKeys: String, CodingKey {
        case data = "sprites"
    }
}
