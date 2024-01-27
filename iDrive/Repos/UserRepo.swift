//
//  UserRepo.swift
//  iDrive
//
//  Created by Samy Mehdid on 27/1/2024.
//

import Foundation

class UserRepo: NetworkManager {

    static let shared = UserRepo()

    enum Endpoints: String {
        case me = "/clients/me"
    }

    func getMe() async throws -> User {
        return try await self.get(endpoint: Endpoints.me.rawValue)
    }
}
