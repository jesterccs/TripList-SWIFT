//
//  ContentView.swift
//  TripListApp
//
//  Created by Chamika Sakalasuriya on 2023-11-10.
//

import SwiftUI

struct ContentView: View {
    
    @State var tripViewModel: TripViewModel = TripViewModel()
    @State var selectedColor: Color = .black
    @State var fontSize: Double = 20.0
    
    var body: some View {
        TabView {
            TripList(tripViewModel: tripViewModel, selectedColor: selectedColor, fontSize: fontSize)
                .tabItem { Label("Trips", systemImage:"allergens") }
            
            CompletedTrips(tripViewModel: tripViewModel)
                .tabItem { Label("Completed Trips", systemImage: "checkmark.circle.fill") }
            
            SettingsView(fontSize: $fontSize, selectedColor: $selectedColor)
                .tabItem { Label("Settings", systemImage: "gear.circle.fill") }
        }
    }
}

#Preview {
    ContentView()
        
}
