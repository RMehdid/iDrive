//
//  Package.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

struct Package: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let pricing: Pricing
    
    var imageName: String {
        switch id {
        case 1: return "building.2.crop.circle.fill"
        case 2: return "car.rear.road.lane"
        case 3: return "escape"
        case 4: return "beach.umbrella.fill"
        default: return ""
        }
    }
}
