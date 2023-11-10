//
//  TripViewModel.swift
//  TripListApp
//
//  Created by Chamika Sakalasuriya on 2023-11-10.
//

import Foundation
import Observation

@Observable class TripViewModel {
    
    var trips: [Trip] = []
    
    init() {
        addDummyTrips()
    }
    
    func addDummyTrips() {
        let trip1 = Trip(
            image: "paris_image",
            destination: "Paris, France",
            startDate: Date(),
            endDate: Date().addingTimeInterval(7 * 24 * 60 * 60),
            status: .planned,
            accommodation: "Charming Hotel Paris",
            notes: "Excited to explore the city of love!"
        )
        
        let trip2 = Trip(
            image: "tokyo_image",
            destination: "Tokyo, Japan",
            startDate: Date().addingTimeInterval(14 * 24 * 60 * 60),
            endDate: Date().addingTimeInterval(21 * 24 * 60 * 60),
            status: .planned,
            accommodation: "Tokyo Tower Hotel",
            notes: "Looking forward to the unique culture and cuisine of Tokyo!"
        )

        let trip3 = Trip(
            image: "newyork_image",
            destination: "New York City, USA",
            startDate: Date().addingTimeInterval(30 * 24 * 60 * 60),
            endDate: Date().addingTimeInterval(37 * 24 * 60 * 60),
            status: .inProgress,
            accommodation: "Midtown Manhattan Hotel",
            notes: "Business trip with some time for sightseeing!"
            
        )

        let trip4 = Trip(
            image: "barcelona_image",
            destination: "Barcelona, Spain",
            startDate: Date().addingTimeInterval(45 * 24 * 60 * 60),
            endDate: Date().addingTimeInterval(52 * 24 * 60 * 60),
            status: .completed,
            accommodation: "Gothic Quarter Boutique Hotel",
            notes: "Amazing time exploring the beautiful architecture of Barcelona!"
            
        )

        let trip5 = Trip(
            image: "sydney_image",
            destination: "Sydney, Australia",
            startDate: Date().addingTimeInterval(60 * 24 * 60 * 60),
            endDate: Date().addingTimeInterval(67 * 24 * 60 * 60),
            status: .planned,
            accommodation: "Harbour View Sydney Hotel",
            notes: "Excited about the vibrant culture and scenic landscapes of Sydney!"
            
        )
        trips.append(trip1)
        trips.append(trip2)
        trips.append(trip3)
        trips.append(trip4)
        trips.append(trip5)
    }
    
    func deleteTrip(index: IndexSet) {
        trips.remove(atOffsets: index)
    }
}
