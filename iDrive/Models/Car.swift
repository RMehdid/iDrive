//
//  Car.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import Foundation
import CoreLocation

struct Car: Decodable, Identifiable {
    let make: String
    let model: String
    let engine: Engine
    let id: String
    let year: Int
    let fuelLevel: Int
    let coordinates: Coordinates
    let imageUrl: String
    let ownerId: String
    let status: String
    let rating: Double
    let color: String
    let isFreeCancellation: Bool
    
    var coordinatesLocation: CLLocation {
        return CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    func distance(userLocation: CLLocation) -> Double {
        return coordinatesLocation.distance(from: userLocation)
    }
    
    static let sampleCars: [Car] = [
        Car(
            make: "Seat",
            model: "Ibiza",
            engine: .petrol(hp: 110),
            id: "ABC123",
            year: 2019,
            fuelLevel: 70,
            coordinates: Coordinates(latitude: 37.7749, longitude: -122.4194),
            imageUrl: "ibiza",
            ownerId: "Owner123",
            status: "Available",
            rating: 4.5,
            color: "White",
            isFreeCancellation: true
        ),
        Car(
            make: "Seat",
            model: "Ibiza",
            engine: .petrol(hp: 110),
            id: "ABC123",
            year: 2019,
            fuelLevel: 70,
            coordinates: Coordinates(latitude: 37.7749, longitude: -122.4194),
            imageUrl: "ibiza",
            ownerId: "Owner123",
            status: "Available",
            rating: 4.5,
            color: "White",
            isFreeCancellation: true
        ),
        Car(
            make: "Seat",
            model: "Ibiza",
            engine: .petrol(hp: 110),
            id: "ABC123",
            year: 2019,
            fuelLevel: 70,
            coordinates: Coordinates(latitude: 37.7749, longitude: -122.4194),
            imageUrl: "ibiza",
            ownerId: "Owner123",
            status: "Available",
            rating: 4.5,
            color: "White",
            isFreeCancellation: true
        ),
        Car(
            make: "Seat",
            model: "Ibiza",
            engine: .petrol(hp: 110),
            id: "ABC123",
            year: 2019,
            fuelLevel: 70,
            coordinates: Coordinates(latitude: 37.7749, longitude: -122.4194),
            imageUrl: "ibiza",
            ownerId: "Owner123",
            status: "Available",
            rating: 4.5,
            color: "White",
            isFreeCancellation: true
        ),
        Car(
            make: "Seat",
            model: "Ibiza",
            engine: .petrol(hp: 110),
            id: "ABC123",
            year: 2019,
            fuelLevel: 70,
            coordinates: Coordinates(latitude: 37.7749, longitude: -122.4194),
            imageUrl: "ibiza",
            ownerId: "Owner123",
            status: "Available",
            rating: 4.5,
            color: "White",
            isFreeCancellation: true
        )
    ]
}
