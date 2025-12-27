//
//  ContentView.swift
//  ProSettings
//
//  Created by 114-1iosClassStudent05 on 2025/12/27.
//

import SwiftUI

struct ContentView: View {
    let players = Player.top100
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView(players: players)
            }
            .tabItem {
                Label("首頁", systemImage: "house")
            }
            
            NavigationStack {
                PlayersView(players: players)
            }
            .tabItem {
                Label("選手", systemImage: "person.3")
            }
        }
    }
}

#Preview {
    ContentView()
}
