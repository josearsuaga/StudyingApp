//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 08/07/24.
//

import Foundation
import Models
import DataManagement
import Dependencies

public protocol PokemonRepository {
    func fetchPokemons() async throws -> [Pokemon]
}

public struct LivePokemonRepository: PokemonRepository {
    
    @Dependency(\.networkManager) var networkManager
    
    public func fetchPokemons() async throws -> [Pokemon] {
        let pokemonsList: PokemonList = try await networkManager.sendRequest(endpoint: PokemonListEndPoint())
        let pokemonURLs = pokemonsList.results.compactMap { $0.url }
        return try await withThrowingTaskGroup(of: Pokemon?.self) { group in
            for pokemonURL in pokemonURLs {
                group.addTask {
                    try? await self.networkManager.sendRequest(for: pokemonURL)
                }
            }
            var pokemons: [Pokemon] = []
            for try await result in group.compactMap({$0}) {
                pokemons.append(result)
            }
            return pokemons
        }
    }
    
}

private enum PokemonRepositoryKey: DependencyKey {
    static let liveValue: PokemonRepository = LivePokemonRepository()
}

public extension DependencyValues {
    var pokemonRepository: PokemonRepository {
        get { self[PokemonRepositoryKey.self] }
        set { self[PokemonRepositoryKey.self] = newValue }
    }
}
