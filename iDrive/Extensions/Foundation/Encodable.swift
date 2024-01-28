//
//  Encodable.swift
//  iDrive
//
//  Created by Samy Mehdid on 27/1/2024.
//

import Foundation

 extension Encodable {
    var dictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }!
    }
 }
