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
import SwiftUI

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
    
    func selectPokemon(for pokemonToSelect: PokemonSelectionModel) {
    
        for (index, pokemonSection) in pokemonSections.enumerated() {
            for (pokeIndex, pokemon) in pokemonSection.pokemons.enumerated() {
                if pokemon.id == pokemonToSelect.id {
                    pokemonSections[index].pokemons[pokeIndex].isSelected.toggle()
                }
            }
        }
    }
    
}
