//
//  ContentView.swift
//  corridoorApp
//
//  Created by Dev Kunjadia on 6/16/23.
//

import SwiftUI

struct ContentView: View {
    @State var conditional = true
    var body: some View {
        //seeting the background gradient
        ZStack {
            LinearGradient (gradient: Gradient (colors: [.purple, .pink])
                            , startPoint: .top,
                            endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            TabView{
                MapView()
                    .tabItem(){
                        Image(systemName: "map.fill")
                        Text("Explore")
                    }
                SavedView()
                    .tabItem(){
                        Image(systemName: "bookmark.fill")
                        Text("Find Again")
                    }
                LoginView()
                    .tabItem(){
                        Image(systemName: "person.fill")
                        Text("Login")
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
