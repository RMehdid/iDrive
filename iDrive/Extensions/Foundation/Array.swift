//
//  Array.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import Foundation
import _MapKit_SwiftUI

extension Array where Element == Car {
    var markers: [MapMarker] {
        return self.compactMap { car in
            guard let location = car.location else {
                return nil
            }

            return MapMarker(coordinate: location.coordinate)
        }
    }
}
