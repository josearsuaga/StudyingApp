//
//  SwiftUIView.swift
//
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import SwiftUI
import Components
import DataManagement
import PokemonDetail




public struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    public var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)], spacing: 16) {
                    ForEach(viewModel.pokemons) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon.name)) {
                            CardView(title: pokemon.name,
                                     subtitle: pokemon.type,
                                     imageURL: pokemon.image)
                        }
                        .navigationBarTitleDisplayMode(.inline)
                        .buttonStyle(.plain)
                    }
                }
            }
            .accessibilityIdentifier("HomeView")
            .navigationTitle("Pokemons")            
            .task {
                await viewModel.load()
            }        
    }
}


#Preview {
    HomeView(viewModel: HomeViewModel())
}
