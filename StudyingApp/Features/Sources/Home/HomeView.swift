//
//  SwiftUIView.swift
//  
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import SwiftUI
import Components
import DataManagement



public struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)], spacing: 16) {
                ForEach(viewModel.pokemons) { pokemon in
                    CardView(title: pokemon.name,
                             subtitle: pokemon.type,
                             imageURL: pokemon.image)
                }
            }
        }.task {
            await viewModel.load()
        }
    }
}


#Preview {
    HomeView(viewModel: HomeViewModel())
}
