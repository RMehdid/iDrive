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
        case getCars = "/cars"
        case getCar = "/cars/{{car_id}}"
    }

    func getCars(searchText: String? = nil) async throws -> [SimpleCar] {
        var query = [String: Any]()

        if let searchText = searchText {
            query["query"] = searchText
        }

        return try await self.get(endpoint: Endpoints.getCars.rawValue, query: query)
    }

    func getCar(carId: Int) async throws -> Car {
        return try await self.get(
            endpoint: Endpoints
                .getCar
                .rawValue
                .replacingOccurrences(
                    of: "{{car_id}}",
                    with: "\(carId)"
                )
        )
    }
}
