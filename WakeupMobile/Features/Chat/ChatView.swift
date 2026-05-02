import SwiftUI

struct ChatView: View {
    let channelName: String

    private let messages = [
        ChatMessage(author: "Alex", text: "Hey, welcome to Wake Up.", isCurrentUser: false),
        ChatMessage(author: "You", text: "This should look exactly like Discord.", isCurrentUser: true),
        ChatMessage(author: "Sam", text: "SwiftUI on the front end, Go on the backend.", isCurrentUser: false)
    ]

    var body: some View {
        VStack(spacing: 0) {
            header

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(messages) { message in
                        MessageBubble(author: message.author, text: message.text, isCurrentUser: message.isCurrentUser)
                    }
                }
                .padding()
            }
            .background(Color.discordBackground)

            composer
        }
        .background(Color.discordBackground)
    }

    private var header: some View {
        HStack {
            Text("# \(channelName)")
                .font(.headline)
                .foregroundStyle(.white)
            Spacer()
            Image(systemName: "person.3")
                .foregroundStyle(.white.opacity(0.8))
        }
        .padding()
        .background(Color.discordSurface)
    }

    private var composer: some View {
        HStack(spacing: 12) {
            Image(systemName: "plus.circle.fill")
                .foregroundStyle(Color.discordAccent)
            TextField("Message #\(channelName)", text: .constant(""))
                .textFieldStyle(.plain)
                .foregroundStyle(.white)
            Button("Send") { }
                .foregroundStyle(Color.discordAccent)
        }
        .padding()
        .background(Color.discordSurface)
    }
}

private struct ChatMessage: Identifiable {
    let id = UUID()
    let author: String
    let text: String
    let isCurrentUser: Bool
}
