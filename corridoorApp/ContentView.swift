import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var selection = 0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .top, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            TabView(selection: $selection) {
                MapView()
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("Explore")
                    }
                SavedView()
                    .tabItem {
                        Image(systemName: "bookmark.fill")
                        Text("Find Again")
                    }
                if viewModel.isUserLoggedIn {
                    UserProfileView(displayName: viewModel.displayName, signOutAction: viewModel.signOut)
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                        .tag(2)
                } else {
                    LoginView(viewModel: viewModel)
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Login")
                        }
                        .tag(2)
                }
            }
            .onChange(of: viewModel.isUserLoggedIn) { newValue in
                if newValue {
                    selection = 2 // Switch to Profile tab on successful login
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
