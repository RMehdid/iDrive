//
//  BookingUiState.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

enum BookingUiState {
    case idle
    case choosePackage(car: Car, packages: [Package])
    case showPrice(selectedPackage: Package)
    case pay
    case booked
}
