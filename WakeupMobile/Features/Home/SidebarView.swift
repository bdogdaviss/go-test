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
                        .listRowInsets(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                        .onTapGesture {
                            selectedChannel = server.lowercased()
                        }
                }
            } header: {
                Text("Servers")
                    .foregroundStyle(Color.discordTextSecondary)
                    .textCase(nil)
            }

            Section {
                ForEach(directMessages, id: \.self) { message in
                    SidebarRow(title: message, isSelected: false)
                        .listRowInsets(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                }
            } header: {
                Text("Direct Messages")
                    .foregroundStyle(Color.discordTextSecondary)
                    .textCase(nil)
            }
        }
        .scrollContentBackground(.hidden)
        .listStyle(.sidebar)
        .background(Color.discordSidebar)
        .navigationTitle("Discord")
        .toolbarBackground(Color.discordSidebar, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .tint(.white)
    }
}

private struct SidebarRow: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(isSelected ? Color.discordAccent : Color(.systemGray4))
                .frame(width: 10, height: 10)

            Text(title)
                .font(.body.weight(isSelected ? .semibold : .regular))
                .foregroundStyle(.white)

            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(isSelected ? Color.discordSurface : Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .listRowBackground(Color.discordSidebar)
    }
}
