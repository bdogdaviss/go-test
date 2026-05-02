import SwiftUI

struct ChannelListView: View {
    var body: some View {
        List {
            Section("Text Channels") {
                Label("general", systemImage: "number")
                Label("announcements", systemImage: "number")
                Label("random", systemImage: "number")
            }
        }
    }
}
