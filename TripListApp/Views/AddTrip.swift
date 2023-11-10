//
//  AddTrip.swift
//  TripListApp
//
//  Created by Chamika Sakalasuriya on 2023-11-10.
//

import SwiftUI

struct AddTrip: View {
    
    @State var destination: String = ""
    @State var image: String = ""
    @State var StartDate: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Add destination", content: {
                    TextField("", text: $destination)
                })
                
                Section("Add Image", content: {
                    TextField("", text: $destination)
                })
            }.formStyle(.grouped)
        }
    }
}

#Preview {
    AddTrip()
}
