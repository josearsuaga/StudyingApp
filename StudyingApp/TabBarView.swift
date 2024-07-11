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
import Tasks

struct TabBarView: View {
    var body: some View {
        NavigationView {
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
                TasksView(viewModel: TaskViewModel())
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("Tasks")
                    }
                
            }
        }
    }
}

#Preview {
    TabBarView()
}
