//
//  DVError.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import Foundation

enum DVError: Error, Equatable {
    case timout
    case badUrl
    case badResponse
    case badRequest
    case unAuthorized
    case forbidden
    case unknown
    case custom(String)
}
