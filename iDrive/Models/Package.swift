//
//  Package.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

enum Package: Decodable, Identifiable {
    case cityCruiser(pricePerHour: Int, pricePerKm: Int)
    case explorerEscape(pricePerHour: Int, pricePerKm: Int)
    case highwayVoyager(pricePerHour: Int, pricePerKm: Int)
    case epicExpedition(pricePerHour: Int, pricePerKm: Int)
    
    var id: UUID { UUID() }
    
    var name: String {
        switch self {
        case .cityCruiser:
            return "City Cruiser"
        case .explorerEscape:
            return "Explorer Escape"
        case .highwayVoyager:
            return "Highway Voyager"
        case .epicExpedition:
            return "Epic Expedition"
        }
    }
    
    var priceEstimation: Int {
        switch self {
        case .cityCruiser(let pricePerHour, let pricePerKm), .explorerEscape(let pricePerHour, let pricePerKm), .highwayVoyager(let pricePerHour, let pricePerKm), .epicExpedition(let pricePerHour, let pricePerKm):
            return (periodInterval.1 / 60) * pricePerHour + (((distanceInterval.0 + distanceInterval.1) / 2) * pricePerKm)
        }
    }
    
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
    
    var distanceInterval: (Int, Int) {
        switch self {
        case .cityCruiser:
            return (10, 80)
        case .explorerEscape:
            return (80, 160)
        case .highwayVoyager:
            return (160, 480)
        case .epicExpedition:
            return (500, 500)
        }
    }
    
    var periodInterval: (Int, Int) {
        switch self {
        case .cityCruiser:
            return (3600, 21600)
        case .explorerEscape:
            return (14400, 172800)
        case .highwayVoyager:
            return (86400, 259200)
        case .epicExpedition:
            return (259200, 604800)
        }
    }
    
    var pricePerHourPerKm: (Int, Int) {
        switch self {
        case
            .cityCruiser(let pricePerHour, let pricePerKm),
            .explorerEscape(let pricePerHour, let pricePerKm),
            .highwayVoyager(let pricePerHour, let pricePerKm),
            .epicExpedition(let pricePerHour, let pricePerKm):
            return (pricePerHour, pricePerKm)
        }
    }
    
    func calculatePrice(numberOfHours: Int) -> Int {
        return (pricePerHourPerKm.0 * numberOfHours) + (((distanceInterval.0 + distanceInterval.1) / 2) * pricePerHourPerKm.1)
    }
}
