//
//  File.swift
//
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import DataManagement
import Dependencies
import Foundation
import Models
import Repositories


public final class HomeViewModel: ObservableObject {
    
    @Dependency(\.pokemonRepository) var repository
    @Published var pokemons: [PokemonCardModel] = []
    
    public init() { }
    
    
    @MainActor
    func load() async {
        do {
            self.pokemons = try await repository.fetchPokemons().map({ PokemonCardModel(from: $0) })
        } catch {
            print("Error")
        }
        
    }
}
