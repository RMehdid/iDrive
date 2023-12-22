//
//  Engine.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

struct Engine: Decodable {
    let type: EngineType
    let transmission: Transmission
    let horsePower: Int
}
