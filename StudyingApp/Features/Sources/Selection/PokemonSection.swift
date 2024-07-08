//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 08/07/24.
//

import Foundation

struct PokemonSection: Identifiable {
    let id: UUID = UUID()
    let title: String
    let pokemons: [PokemonSelectionModel]
}
