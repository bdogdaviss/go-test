import SwiftUI

struct DiscordStyleRootView: View {
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            ChatView()
        }
    }
}
