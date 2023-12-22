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
    let priceEstimationPerHour: Int
    
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
            coordinates: Coordinates(latitude: 36.726504, longitude: 3.044932),
            imageUrl: "ibiza",
            ownerId: "Owner123",
            status: .available,
            rating: 4.5,
            color: "White",
            isFreeCancellation: true,
            priceEstimationPerHour: 500
        ),
        Car(
            make: "Audi",
            model: "Q7",
            engine: .diesel(hp: 252),
            id: "AUDIQ71",
            year: 2017,
            fuelLevel: 450,
            coordinates: Coordinates(latitude: 36.768274, longitude: 3.056715),
            imageUrl: "q7",
            ownerId: "Owner123",
            status: .outOfService,
            rating: 4.7,
            color: "White",
            isFreeCancellation: true,
            priceEstimationPerHour: 1000
        ),
        Car(
            make: "Chevrolet",
            model: "Aveo",
            engine: .petrol(hp: 85),
            id: "CHEVROLETAVEO1",
            year: 2012,
            fuelLevel: 30,
            coordinates: Coordinates(latitude: 36.793492, longitude: 3.053600),
            imageUrl: "aveo",
            ownerId: "Owner123",
            status: .lowFuel,
            rating: 3.9,
            color: "White",
            isFreeCancellation: false,
            priceEstimationPerHour: 350
        ),
        Car(
            make: "Seat",
            model: "Ibiza",
            engine: .petrol(hp: 110),
            id: "SEATIBIZA2",
            year: 2019,
            fuelLevel: 70,
            coordinates: Coordinates(latitude: 36.717847, longitude: 3.111403),
            imageUrl: "ibiza",
            ownerId: "Owner123",
            status: .rented,
            rating: 4.5,
            color: "White",
            isFreeCancellation: true,
            priceEstimationPerHour: 500
        ),
        Car(
            make: "Seat",
            model: "Ibiza",
            engine: .petrol(hp: 110),
            id: "SEATIBIZA3",
            year: 2019,
            fuelLevel: 70,
            coordinates: Coordinates(latitude: 36.734001, longitude: 3.152378),
            imageUrl: "ibiza",
            ownerId: "Owner123",
            status: .rented,
            rating: 4.5,
            color: "White",
            isFreeCancellation: true
            ,priceEstimationPerHour: 500
        )
    ]
}
