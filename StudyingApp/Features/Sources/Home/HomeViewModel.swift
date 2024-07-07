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


public final class HomeViewModel: ObservableObject {
    
    @Dependency(\.networkManager) var networkManager
    @Published var pokemons: [PokemonCardModel] = []
    
    public init() { }
        
    
    @MainActor
    func load() async {
        do {
            self.pokemons = try await fetchPokemonCards()
        } catch {
            print("Error")
        }
        
    }
    
    
    func fetchPokemonCards() async throws -> [PokemonCardModel] {
        let pokemonsList: PokemonList = try await networkManager.sendRequest(endpoint: PokemonListEndPoint())
        let pokemonURLs = pokemonsList.results.compactMap { $0.url }
        return try await withThrowingTaskGroup(of: Pokemon?.self) { group in
                for pokemonURL in pokemonURLs {
                    group.addTask {
                        try? await self.networkManager.sendRequest(for: pokemonURL)
                    }
                }
                var pokemonCards: [PokemonCardModel] = []
            for try await result in group.compactMap({$0}) {
                pokemonCards.append(PokemonCardModel(from: result))
            }
                return pokemonCards
            }
    }
    
}
