//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import Foundation
import NetworkManager

public final class HomeViewModel: ObservableObject {
    
    let networkManager: NetworkManager
    @Published var pokemons: [Pokemon] = []
    
    public init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    @MainActor
    func load() async {
        do {
            let pokemonsList: PokemonList = try await networkManager.sendRequest(endpoint: PokemonListEndPoint())
            let pokemonURLs = pokemonsList.results.compactMap( { $0.url } )
            
            pokemonURLs.forEach { url in
                Task {
                    let pokemon: Pokemon = try await networkManager.sendRequest(for: url)
                    self.pokemons.append(pokemon)
                }
            }
            
        } catch {
            print("Error")
        }
    }
    
}
