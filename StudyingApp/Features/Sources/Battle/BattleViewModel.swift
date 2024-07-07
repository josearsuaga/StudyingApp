//
//  File.swift
//
//
//  Created by José Arsuaga Sotres on 06/07/24.
//

import Foundation
import DataManagement
import Dependencies
import Models

final public class BattleViewModel: ObservableObject {
    
    @Dependency(\.networkManager) var networkManager
    @Dependency(\.persistenceManager) var persistenceManager    
    @Published var pokemonsForBattle: [PokemonBattleModel] = []
    var availablePokemons: [PokemonSearch] = []
    
    public init() {
        
    }
    
    @MainActor
    func load() async {
        pokemonsForBattle = await fetchBattlePokemons()
        if pokemonsForBattle.isEmpty {
            do {
                pokemonsForBattle = try await fetchBattlePokemonsFromNetwork()
            } catch {
                print("Error")
            }
        }
    }
       
    
    func fetchBattlePokemonsFromNetwork() async throws -> [PokemonBattleModel] {
        let pokemonsList: PokemonList = try await networkManager.sendRequest(endpoint: PokemonListEndPoint())
        let pokemonURLs = pokemonsList.results.compactMap { $0.url }
        let prefixNumber = pokemonURLs.count >= 5 ? 6 : pokemonURLs.count
        let selectedURLs = pokemonURLs.shuffled().prefix(upTo: prefixNumber)
        return try await withThrowingTaskGroup(of: Pokemon?.self) { group in
            for pokemonURL in selectedURLs {
                group.addTask {
                    try? await self.networkManager.sendRequest(for: pokemonURL)
                }
            }
            var pokemonCards: [PokemonBattleModel] = []
            for try await result in group.compactMap({$0}) {
                pokemonCards.append(PokemonBattleModel(from: result))
            }
            return pokemonCards
        }
    }
    
    
    
    func saveBattlePokemons() async {
        do {
            try await persistenceManager.saveData(data: pokemonsForBattle)
        } catch {
            print("Error saving values")
        }
    }
    
    @MainActor
    func removeSavedPokemons() async {
        do {
            try await persistenceManager.removeData(data: pokemonsForBattle)
            self.pokemonsForBattle = try await fetchBattlePokemonsFromNetwork()
        } catch {
            print("Error removing values")
        }
    }
    
    func fetchBattlePokemons() async -> [PokemonBattleModel] {
        do {
            return try await persistenceManager.fetchData()
        } catch {
            print("Error fetching values from file manager")
            return []
        }
    }
}
