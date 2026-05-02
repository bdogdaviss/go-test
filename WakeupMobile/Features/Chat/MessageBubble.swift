import SwiftUI

struct MessageBubble: View {
    let author: String
    let text: String
    let isCurrentUser: Bool

    var body: some View {
        HStack {
            if isCurrentUser { Spacer(minLength: 48) }

            VStack(alignment: .leading, spacing: 4) {
                Text(author)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(Color.discordTextSecondary)

                Text(text)
                    .font(.body)
                    .foregroundStyle(Color.discordTextPrimary)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 12)
                    .background(isCurrentUser ? Color.discordAccent : Color.discordMessage)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
            .frame(maxWidth: 280, alignment: isCurrentUser ? .trailing : .leading)

            if !isCurrentUser { Spacer(minLength: 48) }
        }
    }
}
