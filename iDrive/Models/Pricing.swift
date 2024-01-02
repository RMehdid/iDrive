//
//  Pricing.swift
//  iDrive
//
//  Created by Samy Mehdid on 23/12/2023.
//

import Foundation

struct Pricing: Decodable {
    let initialPrice: Int
    let pricePerExtraHour: Int
    let pricePerExtraKm: Int
}
