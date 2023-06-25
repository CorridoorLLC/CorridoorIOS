//
//  corridoorAppApp.swift
//  corridoorApp
//
//  Created by Dev Kunjadia on 6/16/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

//note to self: https://firebase.google.com/docs/auth/ios/google-signin //finish watching this video

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}
@main
struct corridoorAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
