import SwiftUI

struct MessageBubble: View {
    let author: String
    let text: String
    let isCurrentUser: Bool

    var body: some View {
        HStack {
            if isCurrentUser { Spacer(minLength: 40) }

            VStack(alignment: .leading, spacing: 4) {
                Text(author)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(text)
                    .foregroundStyle(.white)
                    .padding(12)
                    .background(isCurrentUser ? Color.discordAccent.opacity(0.9) : Color.discordMessage)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .frame(maxWidth: 280, alignment: isCurrentUser ? .trailing : .leading)

            if !isCurrentUser { Spacer(minLength: 40) }
        }
    }
}
