//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import Foundation

public struct PokemonList: Codable {    
    public let results: [PokemonSearch]
}

public struct PokemonSearch: Codable {
    public let url: URL?
}
