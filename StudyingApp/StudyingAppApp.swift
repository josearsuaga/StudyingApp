//
//  StudyingAppApp.swift
//  StudyingApp
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import SwiftUI
import Home
import NetworkManager

@main
struct StudyingAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(networkManager: NetworkManager()))
        }
    }
}
