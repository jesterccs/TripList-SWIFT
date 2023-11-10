//
//  TripList.swift
//  TripListApp
//
//  Created by Chamika Sakalasuriya on 2023-11-10.
//

import SwiftUI

struct TripList: View {
    
    var tripViewModel: TripViewModel
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(tripViewModel.trips) { trip in
                        NavigationLink(destination: {
                            TripDetailsView(trip: trip)
                        }, label: {
                            HStack {
                                Image(trip.image)
                                    .resizable()
                                    .frame(width: 120, height: 100)
                                    .cornerRadius(20)
                                VStack {
                                    Text(trip.destination)
                                    if trip.status == .completed {
                                        Text(trip.status.rawValue).foregroundColor(.green)
                                    } else if trip.status == .inProgress {
                                        Text(trip.status.rawValue).foregroundColor(.red)
                                    } else {
                                        Text(trip.status.rawValue).foregroundColor(.blue)
                                    }
                                    
                                }
                            }
                        })
                    }
                    .onDelete(perform: { indexSet in
                        tripViewModel.deleteTrip(index: indexSet)
                    })
                }.listStyle(.plain)
            }
            .padding()
            .navigationTitle("Trips")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: AddTrip(), label: {
                        Text("Add")
                    })
                })
            })
        }
    }
}

#Preview {
    TripList(tripViewModel: TripViewModel())
        
}
