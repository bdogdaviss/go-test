import SwiftUI

struct MessageBubble: View {
    let author: String
    let text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(author)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(text)
                .padding(12)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
