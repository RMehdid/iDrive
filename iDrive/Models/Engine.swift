//
//  Engine.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

enum Engine: Decodable {
    case petrol(hp: Int)
    case diesel(hp: Int)
    
    var toString: String {
        switch self {
        case .petrol(let hp):
            return "Petrol - \(hp)hp"
        case .diesel(let hp):
            return "Diesel - \(hp)hp"
        }
    }
}
