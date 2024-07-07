//
//  File.swift
//
//
//  Created by José Arsuaga Sotres on 06/07/24.
//

import Foundation
import DataManagement
import Models

final public class BattleViewModel: ObservableObject {
    
    private let networkManager = NetworkManager()
    private let persistenceManager = PersistenceManager()
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
        return try await withThrowingTaskGroup(of: Pokemon?.self) { group in
            let pokemonsList: PokemonList = try await networkManager.sendRequest(endpoint: PokemonListEndPoint())
            let pokemonURLs = pokemonsList.results.compactMap { $0.url }
            for pokemonURL in pokemonURLs {
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
    
    func fetchBattlePokemons() async -> [PokemonBattleModel] {
        do {
            return try await persistenceManager.fetchData()
        } catch {
            print("Error fetching values from file manager")
            return []
        }
    }
}
