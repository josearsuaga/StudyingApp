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
import Repositories

final public class BattleViewModel: ObservableObject {
    
    @Dependency(\.pokemonRepository) var repository
    @Dependency(\.persistenceManager) var persistenceManager
    @Published var pokemonsForBattle: [PokemonBattleModel] = []
    var availablePokemons: [Pokemon] = []
    
    public init() {
        
    }
    
    @MainActor
    func load() async {
        pokemonsForBattle = await fetchBattlePokemons()
        if pokemonsForBattle.isEmpty {
            do {
                availablePokemons = try await repository.fetchPokemons()
                pokemonsForBattle = selectRandomPokemons(pokemons: availablePokemons,
                                                         count: 5)
            } catch {
                print("Error")
            }
        }
    }
    
    func selectRandomPokemons(pokemons: [Pokemon], count: Int) -> [PokemonBattleModel] {
        
        //First we will select the fire type pokemon
        guard let firePokemon = pokemons.filter( { $0.types.first?.type.name.lowercased() == "fire" })
            .randomElement() else {
            print("The array doesn't contain any fire pokemon")
            return []
        }
        
        var selectedPokemons = [PokemonBattleModel(from: firePokemon)]
        let otherPokemons = pokemons.filter( {$0.id != firePokemon.id } ).shuffled().prefix(count - 1).map( { PokemonBattleModel(from: $0) })
        selectedPokemons.append(contentsOf: otherPokemons)
        return selectedPokemons
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
            availablePokemons = try await repository.fetchPokemons()
            pokemonsForBattle = selectRandomPokemons(pokemons: availablePokemons,
                                                     count: 5)
        } catch {
            print("Error removing values")
        }
    }
    
    @MainActor
    func shufflePokemons() async {
        do {
            if availablePokemons.isEmpty {
                availablePokemons = try await repository.fetchPokemons()
            }
            pokemonsForBattle = selectRandomPokemons(pokemons: availablePokemons,
                                                     count: 5)
            
        } catch {
            print("Error shuffling pokemons")
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
