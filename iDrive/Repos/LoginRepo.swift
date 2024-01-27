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

    func login(_ credentials: LoginCredentials) async throws -> TokenReponse {

        let query: [String: Any] = [
            "id": credentials.id,
            "phone": credentials.phone
        ]

        return try await self.post(endpoint: Endpoints.login.rawValue, body: query)
    }

    func signUp(user: Client) async throws -> TokenReponse {

        return try await self.post(endpoint: Endpoints.login.rawValue, body: [:])
    }
}
