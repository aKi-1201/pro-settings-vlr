import SwiftUI

struct PlayerDetailView: View {
    let player: Player

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                header
                settingsPager
                settingsList
            }
            .padding()
        }
        .navigationTitle(player.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                Text(player.flag)
                    .font(.largeTitle)
                VStack(alignment: .leading, spacing: 4) {
                    Text(player.name)
                        .font(.title2).bold()
                    Text("\(player.team) · \(player.role)")
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
        }
    }

    private var settingsPager: some View {
        TabView {
            SettingsCard(title: "滑鼠靈敏度", items: [
                ("Sensitivity", String(format: "%.3f", player.settings.sensitivity)),
                ("DPI", "\(player.settings.dpi)"),
                ("eDPI", "\(player.settings.eDPI)")
            ])
            SettingsCard(title: "硬體與Hz", items: [
                ("Polling Rate", "\(player.settings.hz) Hz"),
                ("Scope Sens", String(format: "%.2f", player.settings.scopeSensitivity))
            ])
            SettingsCard(title: "概覽", items: [
                ("隊伍", player.team),
                ("國籍", player.flag),
                ("定位", player.role)
            ])
        }
        .frame(height: 220)
        .tabViewStyle(.page(indexDisplayMode: .automatic))
    }

    private var settingsList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("詳細設定")
                .font(.headline)
            VStack(spacing: 12) {
                settingRow(label: "Sensitivity", value: String(format: "%.3f", player.settings.sensitivity))
                settingRow(label: "DPI", value: "\(player.settings.dpi)")
                settingRow(label: "eDPI", value: "\(player.settings.eDPI)")
                settingRow(label: "Polling Rate", value: "\(player.settings.hz) Hz")
                settingRow(label: "Scope Sensitivity", value: String(format: "%.2f", player.settings.scopeSensitivity))
            }
            .padding()
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }

    private func settingRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
                .foregroundStyle(.secondary)
        }
    }
}

private struct SettingsCard: View {
    let title: String
    let items: [(String, String)]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: .secondarySystemGroupedBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(Color.accentColor)
                ForEach(items, id: \.0) { item in
                    HStack {
                        Text(item.0)
                            .foregroundStyle(.primary)
                        Spacer()
                        Text(item.1)
                            .foregroundStyle(.secondary)
                    }
                    .font(.subheadline)
                }
            }
            .padding(16)
        }
        .padding(.horizontal)
    }
}
