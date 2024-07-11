//
//  SwiftUIView.swift
//  
//
//  Created by José Arsuaga Sotres on 07/07/24.
//

import SwiftUI

public struct PokemonDetailView: View {
    
    @State var pokemonName: String
    
    public init(pokemon: String) {
        self.pokemonName = pokemon
    }
    
    public var body: some View {
        Text(pokemonName)
            .toolbar(.hidden, for: .tabBar)
            
    }
}

#Preview {
    PokemonDetailView(pokemon: "Charmander")
}
