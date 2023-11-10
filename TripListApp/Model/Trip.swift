//
//  Trip.swift
//  TripListApp
//
//  Created by Chamika Sakalasuriya on 2023-11-10.
//

import Foundation
import Observation

@Observable class Trip: Identifiable {
    var id = UUID().uuidString
    var image : String
    var destination: String
    var startDate: Date
    var endDate: Date
    var status: TripStatus
    var accommodation: String
    var notes: String
    
    init(id: String = UUID().uuidString, image: String,destination: String, startDate: Date, endDate: Date, status: TripStatus, accommodation: String, notes: String) {
        self.id = id
        self.image = image
        self.destination = destination
        self.startDate = startDate
        self.endDate = endDate
        self.status = status
        self.accommodation = accommodation
        self.notes = notes
    }
    
}

enum TripStatus: String, CaseIterable {
    case planned = "Planned"
    case inProgress = "In Progress"
    case completed = "Completed"
}

