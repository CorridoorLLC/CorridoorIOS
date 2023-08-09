import SwiftUI
struct UserProfileView: View {
    let displayName: String?
    var signOutAction: () -> Void

    var body: some View {
        VStack {
            Text("Welcome, \(displayName ?? "Unknown User")!")
            // ... other content ...
            Button(action: signOutAction) {
                Text("Sign Out")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}
