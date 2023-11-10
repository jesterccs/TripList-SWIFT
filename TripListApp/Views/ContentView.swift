//
//  ContentView.swift
//  TripListApp
//
//  Created by Chamika Sakalasuriya on 2023-11-10.
//

import SwiftUI

struct ContentView: View {
    
    @State var tripViewModel: TripViewModel = TripViewModel()
    
    var body: some View {
        TabView {
            TripList(tripViewModel: tripViewModel)
                .tabItem { Label("Trips", systemImage:"allergens") }
            
            CompletedTrips()
                .tabItem { Label("Completed Trips", systemImage: "checkmark.circle.fill") }
            
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear.circle.fill") }
        }
    }
}

#Preview {
    ContentView()
        
}
