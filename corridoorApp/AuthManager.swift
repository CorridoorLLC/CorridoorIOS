//
//  AuthManager.swift
//  corridoorApp
//
//  Created by Dev Kunjadia on 7/17/23.
//

import Foundation
import Supabase

class AuthManager {
    static let shared = AuthManager()
    private init() {}
    let client = SupabaseClient(supabaseURL: URL(string:"https://qmrmlymknbredslcrlru.supabase.co")!, supabaseKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFtcm1seW1rbmJyZWRzbGNybHJ1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODkzOTM5NzIsImV4cCI6MjAwNDk2OTk3Mn0.lCV6Yt2PnqLlwFDWnfSjZNcwlFlWNZ66afWYXRcBJNI")
    

    func signInWithApple(idToken: String, nonce: String) async throws {
        Task {
            do {
                let url = try await client.auth.getOAuthSignInURL(provider: **Provider.apple**, redirectTo: URL(string: "https://qmrmlymknbredslcrlru.supabase.co/auth/v1/callback")!)
                safariVC = SFSafariViewController(url: url as URL)
                self.present(safariVC!, animated: true, completion: nil)
            } catch {
                print("### Apple Sign in Error: \(error)")
            }
        }
    }
}
