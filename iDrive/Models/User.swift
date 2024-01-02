//
//  User.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import Foundation

protocol User: Decodable, Identifiable {
    var id: Int { get }
    var firstname: String { get }
    var lastname: String { get }
    var email: String? { get }
    var phone: String { get }
    var profileImageUrl: String? { get }
    var rating: Double { get }
}
