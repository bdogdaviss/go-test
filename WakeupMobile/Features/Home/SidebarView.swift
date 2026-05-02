import SwiftUI

struct SidebarView: View {
    var body: some View {
        List {
            Section("Servers") {
                Text("Wake Up")
                Text("General")
                Text("Gaming")
            }
            Section("Direct Messages") {
                Text("Alex")
                Text("Sam")
                Text("Taylor")
            }
        }
        .navigationTitle("Discord")
    }
}
