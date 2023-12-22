//
//  Owner.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

struct Owner: User {
    var id: String
    var username: String
    var firstname: String
    var lastname: String
    var email: String
    var phone: String
    var profileImageUrl: String
    var rating: Double
    
    static let owner = Owner(id: "1", username: "raynex", firstname: "Samy Abderraouf", lastname: "Mehdid", email: "samy.mhd16@gmail.com", phone: "+213540408051", profileImageUrl: "placeholder", rating: 4.4)
}
