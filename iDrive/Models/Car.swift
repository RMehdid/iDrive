//
//  Car.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import Foundation
import CoreLocation

struct Car: Decodable, Identifiable {
    let id: Int
    let make: String
    let model: String
    let year: Int
    let fuelLevel: Int?
    let engine: Engine
    let coordinates: Coordinates?
    let imageUrl: String
    let owner: Owner
    let status: CarStatus
    let rating: Double
    let color: String
    let isFreeCancelation: Bool
    let packages: [Package]

    var location: CLLocation? {
        guard let latitude = coordinates?.latitude,
              let longitude = coordinates?.longitude else {
                  return nil
              }
        return CLLocation(latitude: latitude, longitude: longitude)
    }

    func distance(userLocation: CLLocation) -> Double? {
        guard let location = location else {
            return nil
        }

        return location.distance(from: userLocation)
    }
}

struct SimpleCar: Decodable, Identifiable {
    let id: Int
    let imageUrl: String
    let model: String
    let color: String
    let year: Int
    let rating: Double
}
