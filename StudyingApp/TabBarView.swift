//
//  ContentView.swift
//  StudyingApp
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import SwiftUI
import Home
import Battle
import Selection
import DataManagement

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView(viewModel: HomeViewModel())
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Home")
                }
            BattleView(viewModel: BattleViewModel())
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Battle Random")
                }
            SelectionView(viewModel: SelectionViewModel())
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Selection")
                }
        }
    }
}

#Preview {
    TabBarView()
}
