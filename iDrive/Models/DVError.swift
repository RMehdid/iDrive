//
//  DVError.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import Foundation

enum DVError: Error {
    case timout
    case badUrl
    case badResponse
    case forbidden
}
