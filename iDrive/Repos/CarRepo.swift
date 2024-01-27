//
//  CarRepo.swift
//  iDrive
//
//  Created by Samy Mehdid on 1/1/2024.
//

import Foundation

class CarRepo: NetworkManager {

    static let shared = CarRepo()

    enum Endpoints: String {
        case all = "/cars"
        case favoriteCars = "/cars/favorites"
        case recentCars = "cars/recent"
        case car = "/cars/{{car_id}}"
    }

    func getCars(searchText: String? = nil) async throws -> [SimpleCar] {
        var query = [String: Any]()

        if let searchText = searchText {
            query["query"] = searchText
        }

        return try await self.get(endpoint: Endpoints.all.rawValue, query: query)
    }

    func getFavoriteCars() async throws -> [SimpleCar] {
        return try await self.get(endpoint: Endpoints.favoriteCars.rawValue)
    }

    func getRecentCars() async throws -> [SimpleCar] {
        return try await self.get(endpoint: Endpoints.recentCars.rawValue)
    }

    func getCar(carId: Int) async throws -> Car {
        return try await self.get(
            endpoint: Endpoints
                .car
                .rawValue
                .replacingOccurrences(
                    of: "{{car_id}}",
                    with: "\(carId)"
                )
        )
    }
}
