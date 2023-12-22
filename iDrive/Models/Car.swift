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
    let status: CarStatus
    let rating: Double
    let color: String
    let isFreeCancellation: Bool
    
    var location: CLLocation {
        return CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    func distance(userLocation: CLLocation) -> Double {
        return location.distance(from: userLocation)
    }
    
    static let sampleCars: [Car] = [
        Car(
            make: "Seat",
            model: "Ibiza",
            engine: .petrol(hp: 110),
            id: "SEATIBIZA1",
            year: 2019,
            fuelLevel: 70,
            coordinates: Coordinates(latitude: 37.7749, longitude: -122.4194),
            imageUrl: "ibiza",
            ownerId: "Owner123",
            status: .available,
            rating: 4.5,
            color: "White",
            isFreeCancellation: true
        ),
        Car(
            make: "Audi",
            model: "Q7",
            engine: .diesel(hp: 252),
            id: "AUDIQ71",
            year: 2017,
            fuelLevel: 450,
            coordinates: Coordinates(latitude: 37.7749, longitude: -122.4194),
            imageUrl: "q7",
            ownerId: "Owner123",
            status: .outOfService,
            rating: 4.7,
            color: "White",
            isFreeCancellation: true
        ),
        Car(
            make: "Chevrolet",
            model: "Aveo",
            engine: .petrol(hp: 85),
            id: "CHEVROLETAVEO1",
            year: 2012,
            fuelLevel: 30,
            coordinates: Coordinates(latitude: 37.7749, longitude: -122.4194),
            imageUrl: "aveo",
            ownerId: "Owner123",
            status: .lowFuel,
            rating: 3.9,
            color: "White",
            isFreeCancellation: false
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
            status: .rented,
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
            status: .rented,
            rating: 4.5,
            color: "White",
            isFreeCancellation: true
        )
    ]
}
