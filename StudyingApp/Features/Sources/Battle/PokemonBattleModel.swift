//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 06/07/24.
//

import Foundation
import Models

struct PokemonBattleModel: Codable, Identifiable {
    let name: String
    let type: String
    let id: Int
    let image: URL?
    
    init(from pokemon: Pokemon) {
        self.name = pokemon.name
        self.type = pokemon.types.first?.type.name ?? ""
        self.id = pokemon.id
        self.image = URL(string: pokemon.sprites.frontDefault)
    }
    
}
