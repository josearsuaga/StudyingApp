//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import Foundation

struct PokemonList: Codable {
    var count: Int
    var next: String
    var results: [Pokemon]
}

struct Pokemon: Codable, Identifiable {
    var id: Int?
    var name: String
    var url: URL?
    var sprites: Sprites?
    
    struct Sprites: Codable {
        var frontDefault: URL?
        enum CodingKeys: String, CodingKey  {
            case frontDefault = "front_default"
        }
    }
}
