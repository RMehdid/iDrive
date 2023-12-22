//
//  Package.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

enum Package: String, Identifiable, CaseIterable {
    case cityCruiser = "City Cruiser"
    case explorerEscape = "Explorer Escape"
    case highwayVoyager = "Highway Voyager"
    case epicExpedition = "Epic Expedition"
    
    var id: UUID { UUID() }
    
    var imageName: String {
        switch self {
        case .cityCruiser:
            return "building.2.crop.circle.fill"
        case .explorerEscape:
            return "escape"
        case .highwayVoyager:
            return "car.rear.road.lane"
        case .epicExpedition:
            return "beach.umbrella.fill"
        }
    }
    
    var description: String {
        switch self {
        case .cityCruiser:
            return "Perfect for short periods and short distances inside the city."
        case .explorerEscape:
            return "Perfect for long periods and short distances inside the city."
        case .highwayVoyager:
            return "Perfect for short periods and long distances across cities."
        case .epicExpedition:
            return "Perfect for vacations that takes longer periods and farther destinations."
        }
    }
}
