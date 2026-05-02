import SwiftUI

struct SidebarView: View {
    @Binding var selectedChannel: String

    private let servers = ["Wake Up", "General", "Gaming"]
    private let directMessages = ["Alex", "Sam", "Taylor"]

    var body: some View {
        List {
            Section {
                ForEach(servers, id: \.self) { server in
                    SidebarRow(title: server, isSelected: selectedChannel == server.lowercased())
                        .onTapGesture {
                            selectedChannel = server.lowercased()
                        }
                }
            } header: {
                Text("Servers")
                    .foregroundStyle(.secondary)
            }

            Section {
                ForEach(directMessages, id: \.self) { message in
                    SidebarRow(title: message, isSelected: false)
                }
            } header: {
                Text("Direct Messages")
                    .foregroundStyle(.secondary)
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.discordSidebar)
        .navigationTitle("Discord")
        .toolbarBackground(Color.discordSidebar, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

private struct SidebarRow: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(isSelected ? Color.discordAccent : Color(.systemGray4))
                .frame(width: 12, height: 12)
            Text(title)
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
        .listRowBackground(Color.discordSidebar)
    }
}
