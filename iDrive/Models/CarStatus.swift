//
//  CarStatus.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

enum CarStatus: String, Decodable {
    case available
    case rented
    case outOfService
    case lowFuel
}
