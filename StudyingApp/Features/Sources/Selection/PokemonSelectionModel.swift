//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 08/07/24.
//

import Foundation
import Models

struct PokemonSelectionModel: Identifiable {
    let id: Int
    let name: String
    let image: URL? 
    var isSelected: Bool = false
    
    init(from pokemon: Pokemon) {
        self.id = pokemon.id
        self.name = pokemon.name
        self.image = URL(string:pokemon.sprites.frontDefault)
    }
}
