//
//  SwiftUIView.swift
//  
//
//  Created by José Arsuaga Sotres on 08/07/24.
//

import SwiftUI
import Components

public struct SelectionView: View {
    @ObservedObject var viewModel: SelectionViewModel
    
    public init(viewModel: SelectionViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        List(viewModel.pokemonSections) { section in
            Section(section.title) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(section.pokemons) { pokemon in
                            CardView(title: pokemon.name,
                                     subtitle: "",
                                     imageURL: pokemon.image)
                        }
                    }
                }
            }
        }.task {
            await viewModel.load()
        }
    }
}

#Preview {
    SelectionView(viewModel: SelectionViewModel())
}
