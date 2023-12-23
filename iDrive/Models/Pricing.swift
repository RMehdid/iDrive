//
//  Pricing.swift
//  iDrive
//
//  Created by Samy Mehdid on 23/12/2023.
//

import Foundation

struct Pricing: Decodable {
    let initialPrice: Int
    let initialPeriod: Int
    let initialDistance: Int
    let pricePerExtraHour: Int
    let pricePerExtraKm: Int
    
    enum CodingKeys: String, CodingKey {
        case initialPrice = "initial_price"
        case initialPeriod = "initial_period"
        case initialDistance = "initial_distance"
        case pricePerExtraHour = "price_per_extra_hour"
        case pricePerExtraKm = "price_per_extra_km"
    }
}
