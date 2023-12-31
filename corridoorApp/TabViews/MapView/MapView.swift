//
//  MapView.swift
//  corridoorApp
//
//  Created by Dev Kunjadia on 6/23/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct MapView: View {
    //does not work
    
    func fetchBuilding() {
        let mapsRef = db.collection("maps")
        
        mapsRef.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID)")
                }
            }
        }
    }


    @State private var buildingName: String = ""
    @State private var startingRoomNumber: String = ""
    @State private var endingRoomNumber: String = ""
    
    let db = Firestore.firestore()
    
    var body: some View {
        VStack{
            Form {
                TextField("Building", text: $buildingName)
                HStack{
                    TextField("Start", text: $startingRoomNumber)
                    TextField("Destination", text: $endingRoomNumber)
                }
                Button (action: fetchBuilding) {
                    Text("Query")
                }
                
            }
            Text("This is where the maps that you query will be rendered")
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
