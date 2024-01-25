//
//  User.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

class User: Decodable, Identifiable {
    private(set) var id: Int
    private(set) var firstname: String
    private(set) var lastname: String
    private(set) var email: String?
    private(set) var phone: String
    private(set) var profileImageUrl: String?
    private(set) var rating: Double

    init(
        id: Int,
        firstname: String,
        lastname: String,
        email: String? = nil,
        phone: String,
        profileImageUrl: String? = nil,
        rating: Double
    ) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.phone = phone
        self.profileImageUrl = profileImageUrl
        self.rating = rating
    }

    var namePlaceholderForImage: String {
        guard let lastnameLetter = lastname.first, let firstnameLetter = firstname.first else {
            return ""
        }

        return lastnameLetter.uppercased() + firstnameLetter.lowercased()
    }
}
