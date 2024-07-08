//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 08/07/24.
//

import Dependencies
import Foundation
import Models
import Repositories

public final class SelectionViewModel: ObservableObject {
    typealias PokemonType = String
    @Dependency(\.pokemonRepository) var repository
    @Published var pokemonSections: [PokemonSection] = []
    
    public init() {
        
    }
    
    @MainActor
    func load() async {
        do {
            let pokemons = try await repository.fetchPokemons()
            pokemonSections = separatePokemonsByType(pokemons: pokemons)
        } catch {
            print("Error")
        }
        
    }
    
    func separatePokemonsByType(pokemons: [Pokemon]) -> [PokemonSection] {
        var groupedPokemons = [PokemonType: [PokemonSelectionModel]]()
        
        for pokemon in pokemons {
            let pokemonSelection = PokemonSelectionModel(from: pokemon)
            for type in pokemon.types {
                if groupedPokemons[type.type.name] != nil {
                    groupedPokemons[type.type.name]?.append(pokemonSelection)
                } else {
                    groupedPokemons[type.type.name] = [pokemonSelection]
                }
            }
        }
        
        return groupedPokemons.map( { PokemonSection(title: $0, pokemons: $1) })
    }
    
}
