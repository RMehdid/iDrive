//
//  LoginRepo.swift
//  iDrive
//
//  Created by Samy Mehdid on 27/1/2024.
//

import Foundation

class LoginRepo: NetworkManager {

    static let shared = LoginRepo()

    enum Endpoints: String {
        case login = "/login/client"
        case signup = "/clients/create"
    }

    func login(id: Int, phone: String) async throws -> TokenReponse {
        let query: [String: Any] = [
            "id": id,
            "phone": phone
        ]

        return try await self.get(endpoint: Endpoints.login.rawValue, query: query)
    }

    func signUp(user: Client) async throws -> TokenReponse {

        return try await self.get(endpoint: Endpoints.login.rawValue, query: user.dictionary)
    }
}
