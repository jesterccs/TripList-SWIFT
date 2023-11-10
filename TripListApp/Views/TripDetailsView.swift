//
//  TripDetailsView.swift
//  TripListApp
//
//  Created by Chamika Sakalasuriya on 2023-11-10.
//

import SwiftUI

struct TripDetailsView: View {
    
    @Bindable var trip: Trip
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(trip.destination)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image(trip.image)
                    .resizable()
                    .scaledToFit()
                
                Text(trip.notes)
                Text("Start Date : \(trip.startDate.formatted())")
                Text("End Date : \(trip.endDate.formatted())")
                HStack{
                    Text("Trip Status : ")
                    Spacer()
                    Picker("", selection: $trip.status, content: {
                        ForEach(TripStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    })
                    
                }
                
                Spacer()
            }
            .navigationTitle("Detailed Trip View")
            .padding()
        }
    }
}

#Preview {
    TripDetailsView(trip: Trip(image: "sydney_image", destination: "Paris", startDate: Date(), endDate: Date(), status: .inProgress, accommodation: "", notes: "Excited about the vibrant culture and scenic landscapes of Sydney!"))
}
