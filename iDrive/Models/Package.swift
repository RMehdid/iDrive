//
//  Package.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

struct Package: Decodable, Identifiable {
    let id: UUID
    let name: String
    let description: String
    let initialPeriod: Int
    let initialDistance: Int
    let pricing: Pricing

    var imageName: String {
        return "building.2.crop.circle.fill"
    }
}
