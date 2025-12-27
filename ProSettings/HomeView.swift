import SwiftUI

struct HomeView: View {
    let players: [Player]

    private var featured: [Player] {
        Array(players.prefix(5))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Valorant Pro Settings")
                    .font(.largeTitle).bold()
                Text("熱門選手與設定速覽")
                    .foregroundStyle(.secondary)
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(featured) { player in
                        NavigationLink {
                            PlayerDetailView(player: player)
                        } label: {
                            PlayerFeatureCard(player: player)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("首頁")
    }
}

struct PlayerFeatureCard: View {
    let player: Player

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(colors: [.purple.opacity(0.8), .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            VStack(alignment: .leading, spacing: 8) {
                Text(player.flag)
                    .font(.largeTitle)
                Text(player.name)
                    .font(.title).bold()
                    .foregroundStyle(.white)
                Text(player.team)
                    .foregroundStyle(.white.opacity(0.8))
                HStack(spacing: 12) {
                    Label("sens \(player.settings.sensitivity, specifier: "%.3f")", systemImage: "cursorarrow.rays")
                    Label("eDPI \(player.settings.eDPI)", systemImage: "bolt.fill")
                }
                .foregroundStyle(.white)
            }
            .padding()
        }
        .padding(.horizontal)
    }
}
