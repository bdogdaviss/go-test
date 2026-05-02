import SwiftUI

struct DiscordStyleRootView: View {
    @State private var selectedChannel = "general"
    @State private var showSidebar = false

    var body: some View {
        NavigationStack {
            ChatView(channelName: selectedChannel, onMenuTap: { showSidebar = true })
                .navigationDestination(isPresented: $showSidebar) {
                    SidebarSelectionView(selectedChannel: $selectedChannel, showSidebar: $showSidebar)
                }
        }
        .tint(.white)
        .background(Color.discordBackground)
    }
}

private struct SidebarSelectionView: View {
    @Binding var selectedChannel: String
    @Binding var showSidebar: Bool

    private let servers = ["wake up", "general", "gaming"]
    private let directMessages = ["Alex", "Sam", "Taylor"]

    var body: some View {
        List {
            Section("Servers") {
                ForEach(servers, id: \.self) { server in
                    Button {
                        selectedChannel = server
                        showSidebar = false
                    } label: {
                        Text(server.capitalized)
                    }
                }
            }

            Section("Direct Messages") {
                ForEach(directMessages, id: \.self) { message in
                    Text(message)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.discordSidebar)
        .foregroundStyle(.white)
        .navigationTitle("Discord")
        .toolbarBackground(Color.discordSidebar, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}
