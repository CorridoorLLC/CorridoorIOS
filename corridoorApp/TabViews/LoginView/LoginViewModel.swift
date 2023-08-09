import Combine
import GoogleSignIn
import Firebase
import FirebaseAuth
import SwiftUI

class UIHelper {
    static func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}

final class LoginViewModel: ObservableObject {
    @Published var isUserLoggedIn = false
    @Published var displayName: String? = nil

    init(){
            self.isUserLoggedIn = UserDefaults.standard.bool(forKey: "signIn")
            self.displayName = UserDefaults.standard.string(forKey: "displayName")
    }
    func signOut() {
            do {
                try Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "signIn")
                UserDefaults.standard.removeObject(forKey: "displayName")
                self.isUserLoggedIn = false
                self.displayName = nil
            } catch let error {
                print("Error signing out: \(error)")
            }
    }
    func signIn(){
        print("attempting to sign in using GID")
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: UIHelper.getRootViewController()) { [unowned self] result, error in
          guard error == nil else {
            return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else {
                    print("ERROR")
                    return
                }
                print("SIGN IN")
                UserDefaults.standard.set(true, forKey: "signIn")
                UserDefaults.standard.set(result?.user.displayName, forKey: "displayName")
                self.isUserLoggedIn = true
                self.displayName = result?.user.displayName // Assuming displayName is available here
            }
            
        }
    }
}
