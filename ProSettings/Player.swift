import Foundation
import SwiftUI

struct PlayerSettings: Equatable, Hashable {
    let sensitivity: Double
    let dpi: Int
    let hz: Int
    let scopeSensitivity: Double
    var eDPI: Int { Int((sensitivity * Double(dpi)).rounded()) }
}

struct Player: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let team: String
    let countryCode: String
    let role: String
    let popularity: Int
    let settings: PlayerSettings

    var flag: String {
        let base: UInt32 = 127397
        let scalars = countryCode.uppercased().unicodeScalars.compactMap { UnicodeScalar(base + $0.value) }
        return String(String.UnicodeScalarView(scalars))
    }
    var imageURL: URL? {
        let base = "https://prosettings.net/wp-content/uploads/"
        let suffix = "-200x200-2x-fitcontain-q99-gb283-s1.png"
        let encodedName = name.lowercased().replacingOccurrences(of: " ", with: "-")
        return URL(string: base + encodedName + suffix)
    }
}

extension Player {
    static let basePlayers: [Player] = [
        Player(name: "TenZ", team: "Sentinels", countryCode: "CA", role: "Flex", popularity: 99, settings: .init(sensitivity: 0.204, dpi: 1600, hz: 1000, scopeSensitivity: 1.0)),
        Player(name: "Derke", team: "Team Vitality", countryCode: "FI", role: "Duelist", popularity: 97, settings: .init(sensitivity: 0.74, dpi: 400, hz: 2000, scopeSensitivity: 1.0)),
        Player(name: "aspas", team: "MIBR", countryCode: "BR", role: "Duelist", popularity: 96, settings: .init(sensitivity: 0.4, dpi: 800, hz: 1000, scopeSensitivity: 1.0)),
        Player(name: "f0rsakeN", team: "Paper Rex", countryCode: "ID", role: "Flex", popularity: 94, settings: .init(sensitivity: 0.645, dpi: 800, hz: 4000, scopeSensitivity: 1.0)),
        Player(name: "ZmjjKK", team: "EDward Gaming", countryCode: "CN", role: "Duelist", popularity: 92, settings: .init(sensitivity: 0.1, dpi: 1600, hz: 4000, scopeSensitivity: 1.0)),
        Player(name: "Jinggg", team: "Paper Rex", countryCode: "SG", role: "Duelist", popularity: 92, settings: .init(sensitivity: 0.195, dpi: 1600, hz: 2000, scopeSensitivity: 1.1)),
        Player(name: "Asuna", team: "100 Thieves", countryCode: "US", role: "Flex", popularity: 91, settings: .init(sensitivity: 0.26, dpi: 1400, hz: 1000, scopeSensitivity: 0.7)),
        Player(name: "Leaf", team: "G2", countryCode: "US", role: "Sentinel", popularity: 90, settings: .init(sensitivity: 0.08, dpi: 1600, hz: 2000, scopeSensitivity: 1.0)),
        Player(name: "Demon1", team: "LFT", countryCode: "US", role: "Duelist", popularity: 89, settings: .init(sensitivity: 0.1, dpi: 1600, hz: 1000, scopeSensitivity: 1.0)),
        Player(name: "wo0t", team: "Team Heretics", countryCode: "TR", role: "Flex", popularity: 89, settings: .init(sensitivity: 0.5, dpi: 500, hz: 4000, scopeSensitivity: 0.9)),
        Player(name: "t3xture", team: "GenG", countryCode: "KR", role: "Duelist", popularity: 89, settings: .init(sensitivity: 0.45, dpi: 800, hz: 1000, scopeSensitivity: 1.0)),
        Player(name: "Boaster", team: "Fnatic", countryCode: "GB", role: "Controller", popularity: 89, settings: .init(sensitivity: 0.24, dpi: 800, hz: 1000, scopeSensitivity: 1.0)),
        Player(name: "kaajak", team: "Fnatic", countryCode: "PL", role: "Duelist", popularity: 89, settings: .init(sensitivity: 0.1, dpi: 1600, hz: 4000, scopeSensitivity: 1.0)),
        Player(name: "Alfajer", team: "Fnatic", countryCode: "TR", role: "Sentinel", popularity: 93, settings: .init(sensitivity: 0.45, dpi: 800, hz: 1000, scopeSensitivity: 1.0)),
        Player(name: "s0m", team: "NRG", countryCode: "US", role: "Controller", popularity: 89, settings: .init(sensitivity: 0.8, dpi: 400, hz: 1000, scopeSensitivity: 1.0)),
        Player(name: "nAts", team: "Team Liquid", countryCode: "RU", role: "Sentinel", popularity: 89, settings: .init(sensitivity: 0.49, dpi: 800, hz: 1000, scopeSensitivity: 1.0)),
        Player(name: "Zekken", team: "MIBR", countryCode: "US", role: "Flex", popularity: 89, settings: .init(sensitivity: 0.175, dpi: 1600, hz: 1000, scopeSensitivity: 0.8)),
        Player(name: "happywei", team: "XLG", countryCode: "TW", role: "Sentinel", popularity: 89, settings: .init(sensitivity: 0.712, dpi: 800, hz: 1000, scopeSensitivity: 1.15)),
        Player(name: "yay", team: "LFT", countryCode: "US", role: "Sentinel", popularity: 89, settings: .init(sensitivity: 0.38, dpi: 800, hz: 1000, scopeSensitivity: 0.8)),
        Player(name: "brawk", team: "NRG", countryCode: "US", role: "Initiator", popularity: 89, settings: .init(sensitivity: 0.2, dpi: 800, hz: 1000, scopeSensitivity: 1.0)),
        Player(name: "Chronicle", team: "Team Vitality", countryCode: "RU", role: "Initiator", popularity: 89, settings: .init(sensitivity: 0.125, dpi: 1600, hz: 1000, scopeSensitivity: 0.95)),
    ]

    static let top100: [Player] = basePlayers
}
