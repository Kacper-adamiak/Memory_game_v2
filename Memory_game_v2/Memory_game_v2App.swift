//
//  Memory_game_v2App.swift
//  Memory_game_v2
//
//  Created by student on 16/10/2023.
//

import SwiftUI

@main
struct Memory_game_v2App: App {
    @StateObject var game = MemoGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
