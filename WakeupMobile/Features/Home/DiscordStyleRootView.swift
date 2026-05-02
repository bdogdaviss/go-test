import SwiftUI

struct DiscordStyleRootView: View {
    @State private var selectedChannel = "general"

    var body: some View {
        NavigationSplitView {
            SidebarView(selectedChannel: $selectedChannel)
                .navigationSplitViewColumnWidth(min: 220, ideal: 260)
        } detail: {
            ChatView(channelName: selectedChannel)
        }
        .navigationSplitViewStyle(.balanced)
        .background(Color.discordBackground)
    }
}
