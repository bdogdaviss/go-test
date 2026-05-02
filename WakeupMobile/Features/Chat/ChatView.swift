import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    MessageBubble(author: "Alex", text: "Hey, welcome to Wake Up.")
                    MessageBubble(author: "You", text: "This should look exactly like Discord.")
                    MessageBubble(author: "Sam", text: "SwiftUI on the front end, Go on the backend.")
                }
                .padding()
            }

            HStack {
                TextField("Message #general", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                Button("Send") { }
            }
            .padding()
            .background(Color(.systemGray6))
        }
        .navigationTitle("# general")
    }
}
