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

@main
struct corridoorAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
