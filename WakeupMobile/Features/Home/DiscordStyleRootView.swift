import SwiftUI

struct DiscordStyleRootView: View {
    @State private var selectedChannel = "general"

    var body: some View {
        NavigationSplitView {
            SidebarView(selectedChannel: $selectedChannel)
        } detail: {
            ChatView(channelName: selectedChannel)
        }
        .navigationSplitViewStyle(.balanced)
        .background(Color.discordBackground)
    }
}
