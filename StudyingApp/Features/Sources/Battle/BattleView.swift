//
//  SwiftUIView.swift
//  
//
//  Created by José Arsuaga Sotres on 06/07/24.
//

import SwiftUI
import Components

public struct BattleView: View {
    
    @ObservedObject var viewModel: BattleViewModel
    
    public init(viewModel: BattleViewModel) {
        self.viewModel = viewModel
    }
    public var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(viewModel.pokemonsForBattle) { pokemon in
                        CardView(title: pokemon.name,
                                 subtitle: pokemon.type,
                                 imageURL: pokemon.image)
                    }
                }
            }.padding(.vertical, 200)
            Button("Save") {
                Task {
                    await viewModel.saveBattlePokemons()
                }
            }
            Spacer()
        }
        .task {
            await viewModel.load()
        }
    }
}

#Preview {
    BattleView(viewModel: BattleViewModel())
}
