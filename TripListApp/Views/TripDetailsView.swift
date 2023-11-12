//
//  TripDetailsView.swift
//  TripListApp
//
//  Created by Chamika Sakalasuriya on 2023-11-10.
//

import SwiftUI
import Foundation



struct TripDetailsView: View {
    
    @Bindable var trip: Trip
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(trip.destination)
                    .font(.title)
                    .fontWeight(.bold)
                Image(trip.image)
                    .resizable()
                    .scaledToFit()
                
                Text(trip.notes)
                
                
                    DatePicker("Start Date", selection: $trip.startDate, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                DatePicker("End Date", selection: $trip.endDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                
                HStack{
                    Text("Trip Status : ")
                    Spacer()
                    Picker("", selection: $trip.status, content: {
                        ForEach(TripStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    })
                    
                }
                .padding()
                
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
