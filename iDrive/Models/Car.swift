//
//  Car.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import Foundation
import CoreLocation

struct Car: Decodable, Identifiable {
    let id: String
    let make: String
    let model: String
    let year: Int
    let fuelLevel: Int
    let engine: Engine
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
            id: "SEATIBIZA1",
            make: "Seat",
            model: "Ibiza",
            year: 2019,
            fuelLevel: 70,
            engine: Engine(type: .petrol, transmission: .manual, horsePower: 110),
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
            id: "AUDIQ71",
            make: "Audi",
            model: "Q7",
            year: 2017,
            fuelLevel: 450,
            engine: Engine(type: .diesel, transmission: .automatic, horsePower: 252),
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
            id: "CHEVROLETAVEO1",
            make: "Chevrolet",
            model: "Aveo",
            year: 2012,
            fuelLevel: 30,
            engine: Engine(type: .petrol, transmission: .manual, horsePower: 85),
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
            id: "SEATIBIZA2",
            make: "Seat",
            model: "Ibiza",
            year: 2019,
            fuelLevel: 70,
            engine: Engine(type: .petrol, transmission: .manual, horsePower: 110),
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
            id: "SEATIBIZA3",
            make: "Seat",
            model: "Ibiza",
            year: 2019,
            fuelLevel: 70,
            engine: Engine(type: .petrol, transmission: .manual, horsePower: 110),
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
