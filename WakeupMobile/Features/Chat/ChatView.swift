import SwiftUI

struct ChatView: View {
    let channelName: String
    var onMenuTap: () -> Void = {}

    @State private var draftMessage = ""
    @State private var messages: [ChatMessage] = [
        ChatMessage(author: "Alex", text: "Hey, welcome to Wake Up.", isCurrentUser: false),
        ChatMessage(author: "You", text: "This should look exactly like Discord.", isCurrentUser: true),
        ChatMessage(author: "Sam", text: "SwiftUI on the front end, Go on the backend.", isCurrentUser: false)
    ]

    var body: some View {
        VStack(spacing: 0) {
            header

            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(messages) { message in
                            MessageBubble(author: message.author, text: message.text, isCurrentUser: message.isCurrentUser)
                                .id(message.id)
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 12)
                    .padding(.bottom, 16)
                }
                .background(Color.discordBackground)
                .onChange(of: messages.count) { _, _ in
                    guard let last = messages.last else { return }
                    withAnimation {
                        proxy.scrollTo(last.id, anchor: .bottom)
                    }
                }
            }

            composer
        }
        .background(Color.discordBackground)
    }

    private var header: some View {
        HStack(spacing: 12) {
            Button(action: onMenuTap) {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.white)
            }

            Text("# \(channelName)")
                .font(.headline.weight(.semibold))
                .foregroundStyle(.white)

            Spacer()

            Image(systemName: "person.3")
                .foregroundStyle(Color.discordTextSecondary)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(Color.discordSurface)
    }

    private var composer: some View {
        HStack(spacing: 10) {
            Image(systemName: "plus.circle.fill")
                .foregroundStyle(Color.discordAccent)

            TextField("Message #\(channelName)", text: $draftMessage)
                .textFieldStyle(.plain)
                .foregroundStyle(.white)
                .submitLabel(.send)
                .onSubmit(sendMessage)

            Button("Send", action: sendMessage)
                .font(.body.weight(.semibold))
                .foregroundStyle(draftMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? Color.discordTextSecondary : Color.discordAccent)
                .disabled(draftMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(Color.discordSurface)
    }

    private func sendMessage() {
        let trimmed = draftMessage.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        messages.append(ChatMessage(author: "You", text: trimmed, isCurrentUser: true))
        draftMessage = ""
    }
}

private struct ChatMessage: Identifiable {
    let id = UUID()
    let author: String
    let text: String
    let isCurrentUser: Bool
}
