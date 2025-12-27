import SwiftUI

struct HomeView: View {
    let players: [Player]
    
    private var featured: [Player] {
        Array(players.prefix(5))
    }
    
    private let mvps: [(title: String, team: String, winner: String)] = [
        ("2025 Champion", "NRG", "Brawk"),
        ("2025 Masters Toronto", "PRX", "f0rsakeN"),
        ("2025 Masters Bangkok", "T1", "Meteor"),
        ("2024 Champion", "EDG", "Zmjjkk"),
        ("2024 Masters Shanghai", "GenG", "t3xture"),
        ("2024 Masters Madrid", "SEN", "zekken"),
        ("2023 Champion", "EG", "Demon1"),
        ("2023 Masters Tokyo", "FNC", "Alfajer"),
        ("2023 LOCK//IN São Paulo", "FNC", "Leo"),
        ("2022 Champion", "LOUD", "aspas")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Valorant Pro Settings")
                    .font(.largeTitle).bold()
                Text("熱門選手與設定速覽")
                    .foregroundStyle(.secondary)
                TabView {
                    ForEach(featured) { player in
                        NavigationLink {
                            PlayerDetailView(player: player)
                        } label: {
                            PlayerFeatureCard(player: player, color: .blue.opacity(0.6))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .frame(height: 220)
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                Text("歷屆大賽 MVP 速覽")
                    .foregroundStyle(.secondary)
                TabView {
                    ForEach(mvps, id: \.title) { item in
                        if let player = player(for: item.winner) {
                            NavigationLink {
                                PlayerDetailView(player: player)
                            } label: {
                                MvpFeatureCard(title: item.title, player: player, team: item.team)
                            }
                            .buttonStyle(.plain)
                        } else {
                        }
                    }
                }
                .frame(height: 260)
                .tabViewStyle(.page(indexDisplayMode: .automatic))
            }
            .padding()
        }
        .navigationTitle("首頁")
    }
    
    private func player(for winner: String) -> Player? {
        let parts = winner.split(separator: " ")
        let candidate = (parts.last.map(String.init) ?? winner).lowercased()
        return players.first { $0.name.lowercased() == candidate }
    }
}

struct PlayerFeatureCard: View {
    let player: Player
    let color: Color

    init(player: Player, color: Color = .blue) {
        self.player = player
        self.color = color
    }

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: .secondarySystemGroupedBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            VStack(alignment: .leading, spacing: 8) {
                Text(player.flag)
                    .font(.largeTitle)
                Text(player.name)
                    .font(.title).bold()
                    .foregroundStyle(.primary)
                Text(player.team)
                    .foregroundStyle(.secondary)
                HStack(spacing: 12) {
                    Label("sens \(player.settings.sensitivity, specifier: "%.3f")", systemImage: "cursorarrow.rays")
                    Label("DPI \(player.settings.dpi)", systemImage: "bolt.fill")
                }
                .foregroundStyle(.secondary)
            }
            .padding(16)
        }
        .padding(.horizontal)
    }
}

private struct MvpFeatureCard: View {
    let title: String
    let player: Player
    let team: String

    var body: some View {
        ZStack(alignment: .topTrailing) {
            PlayerFeatureCard(player: player, color: .blue.opacity(0.8))
                .padding(.bottom, 24)
            Text("\(title) winner: \(team)")
                .font(.headline)
                .padding(8)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(8)
        }
    }
}
