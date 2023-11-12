//
//  TripList.swift
//  TripListApp
//
//  Created by Chamika Sakalasuriya on 2023-11-10.
//

import SwiftUI

struct TripList: View {
    
    var tripViewModel: TripViewModel
    @State var sheetEnabled: Bool = false
    var selectedColor: Color
    var fontSize: Double
    
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
                                        .foregroundColor(selectedColor)
                                    if trip.status == .completed {
                                        Text(trip.status.rawValue).foregroundColor(.green)
                                    } else if trip.status == .inProgress {
                                        Text(trip.status.rawValue).foregroundColor(.red)
                                    } else {
                                        Text(trip.status.rawValue).foregroundColor(.blue)
                                    }
                                    
                                }
                                .font(.system(size: fontSize))
                            }
                        })
                    }
                    .onDelete(perform: { indexSet in
                        tripViewModel.deleteTrip(index: indexSet)
                    })
                }.listStyle(.plain)
            }
            .padding()
            .navigationTitle(Text("Trips").foregroundColor(selectedColor))
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        sheetEnabled.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                })
            })
            .sheet(isPresented: $sheetEnabled, content: {
                AddTrip(tripViewModel: tripViewModel)
            })
        }
    }
}

#Preview {
    TripList(tripViewModel: TripViewModel(), selectedColor: .black, fontSize: 20.0)
        
}
