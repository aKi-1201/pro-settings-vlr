import SwiftUI

struct PlayersView: View {
    let players: [Player]

    private var sortedPlayers: [Player] {
        players.sorted { $0.name < $1.name }
    }

    var body: some View {
        List(sortedPlayers) { player in
            NavigationLink {
                PlayerDetailView(player: player)
            } label: {
                PlayerRow(player: player)
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("選手列表")
    }
}

struct PlayerRow: View {
    let player: Player

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: player.imageURL) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().aspectRatio(contentMode: .fill)
                default:
                    Color.gray.opacity(0.2)
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            Text(player.flag)
                .font(.largeTitle)
            VStack(alignment: .leading, spacing: 4) {
                Text(player.name)
                    .font(.headline)
                Text("\(player.team) · \(player.role)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text("eDPI \(player.settings.eDPI)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
