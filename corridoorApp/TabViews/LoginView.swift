//
//  LoginView.swift
//  corridoorApp
//
//  Created by Dev Kunjadia on 6/23/23.
//

import SwiftUI

struct LoginView: View {
    func googleSignInHandler(){
        print("Attempting to sign in")
    }
    var body: some View {
        VStack{
            Text("This is where you can login in case you need to access private maps, etc.")
            Button(action : googleSignInHandler){
                Text("Sign in with Google")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
