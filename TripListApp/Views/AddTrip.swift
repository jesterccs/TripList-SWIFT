//
//  AddTrip.swift
//  TripListApp
//
//  Created by Chamika Sakalasuriya on 2023-11-10.
//

import SwiftUI

struct AddTrip: View {
    
    var tripViewModel: TripViewModel
    
    @State var destination: String = ""
    @State var image: String = ""
    @State var StartDate: String = ""
    @State var startDate = Date()
    @State var endDate = Date()
    @State var selectedStatus: TripStatus = .planned
    @State var accomodation = ""
    @State var notes = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Add destination", content: {
                    TextField("", text: $destination)
                })
                
                Section("Add Image", content: {
                    TextField("", text: $image)
                })
                
                Section("Start Date", content: {
                    DatePicker("Start Date", selection: $startDate, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                    DatePicker("Start Date", selection: $endDate, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                })
                
                Section("Trip Status", content: {
                    Picker("Status", selection: $selectedStatus, content: {
                        ForEach(TripStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    })
                })
                
                Section("Accomodation", content: {
                    TextField("", text: $accomodation)
                })
                
                Section("Notes", content: {
                    TextField("", text: $notes)
                })
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button("Add", action:  {
                        let tripModel = Trip(image: image, destination: destination, startDate: startDate, endDate: endDate, status: selectedStatus, accommodation: accomodation, notes: notes)
                        
                        tripViewModel.addTrip(tripModel: tripModel)
                        
                        dismiss()
                    })
                })
                
                ToolbarItem(placement: .topBarLeading, content: {
                    Button("Cancel", action:  {
                        dismiss()
                    })
                })
            })
        }
    }
}

#Preview {
    AddTrip(tripViewModel: TripViewModel())
}
