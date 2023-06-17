//
//  ContentView.swift
//  corridoorApp
//
//  Created by Dev Kunjadia on 6/16/23.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        //seeting the background gradient
        ZStack {
            LinearGradient (gradient: Gradient (colors: [.purple, .pink])
                            , startPoint: .top,
                            endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Corridoor")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(0)
                    .frame(width: 300.0, height: 59)
                Text("Find your way.")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.912))
                    .multilineTextAlignment(.center)
                    .lineLimit(0)
                    .frame(width: 200.0, height: 59)
                Button("Button title") {
                    print("Button tapped!")
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
