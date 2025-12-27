//
//  ContentView.swift
//  ProSettings
//
//  Created by 114-1iosClassStudent05 on 2025/12/27.
//

import SwiftUI

struct ContentView: View {
    private let players = Player.top100

    var body: some View {
        NavigationStack {
            TabView {
                HomeView(players: players)
                    .tabItem {
                        Label("首頁", systemImage: "house.fill")
                    }
                PlayersView(players: players)
                    .tabItem {
                        Label("選手", systemImage: "list.bullet")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
