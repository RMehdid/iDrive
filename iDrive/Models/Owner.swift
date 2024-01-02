//
//  Owner.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

struct Owner: User {
    var id: Int
    var firstname: String
    var lastname: String
    var email: String?
    var phone: String
    var profileImageUrl: String?
    var rating: Double
}
