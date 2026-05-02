import SwiftUI

struct ChannelListView: View {
    var body: some View {
        List {
            Section {
                Label("general", systemImage: "number")
                Label("announcements", systemImage: "number")
                Label("random", systemImage: "number")
            } header: {
                Text("Text Channels")
                    .foregroundStyle(.secondary)
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.discordSidebar)
        .foregroundStyle(.white)
    }
}
