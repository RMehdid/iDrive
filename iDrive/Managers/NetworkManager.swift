//
//  NetworkManager.swift
//  iDrive
//
//  Created by Samy Mehdid on 1/1/2024.
//

import Foundation
import Alamofire

class NetworkManager {

    let session = Session(eventMonitors: [NetworkLogger()])

    private var headers: HTTPHeaders {
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(UserDefaults.standard.accessToken ?? "")"
        ]
    }

    private var baseUrl: String {
        return Bundle.main.object(forInfoDictionaryKey: "BaseUrl") as? String ?? ""
    }

    private let timout: Double = 15

    public func get<Model: Decodable>(endpoint: String, query: [String: Any]? = nil) async throws -> Model {

        return try await withCheckedThrowingContinuation { continuation in
            session.request(
                baseUrl + endpoint,
                method: .get,
                parameters: query,
                headers: headers,
                requestModifier: { $0.timeoutInterval = self.timout }
            )
            .responseData { response in

                guard let status = response.response?.statusCode else {
                    continuation.resume(throwing: DVError.badResponse)
                    return
                }

                switch status {
                case 404:
                    continuation.resume(throwing: DVError.badUrl)
                case 400:
                    continuation.resume(throwing: DVError.badRequest)
                case 401:
                    continuation.resume(throwing: DVError.unAuthorized)
                case 400...499:
                    continuation.resume(throwing: DVError.forbidden)
                case 200...299:
                    switch response.result {
                    case .success(let res):
                        do {
                            let decodedModel = try JSONDecoder().decode(Model.self, from: res)
                            continuation.resume(returning: decodedModel)
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }

                default: continuation.resume(throwing: DVError.unknown)
                }
            }
        }
    }

    public func post<Model: Decodable>(endpoint: String, body: [String: Any]) async throws -> Model {

        return try await withCheckedThrowingContinuation { continuation in
            let jsonBody: Data
            do {
                jsonBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                continuation.resume(throwing: error)
                return
            }

            guard let url = URL(string: baseUrl + endpoint) else {
                continuation.resume(throwing: DVError.badUrl)
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonBody
            request.headers = headers
            request.timeoutInterval = self.timout

            session.request(request)
            .responseData { response in
                guard let status = response.response?.statusCode else {
                    continuation.resume(throwing: DVError.badResponse)
                    return
                }

                switch status {
                case 404:
                    continuation.resume(throwing: DVError.badUrl)
                case 400...499:
                    continuation.resume(throwing: DVError.forbidden)
                case 200...299:
                    switch response.result {
                    case .success(let res):
                        do {
                            let decodedModel = try JSONDecoder().decode(Model.self, from: res)
                            continuation.resume(returning: decodedModel)
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure:
                        continuation.resume(throwing: DVError.timout)
                    }

                default: continuation.resume(throwing: DVError.unknown)
                }
            }
        }
    }

    public func put(endpoint: String, body: [String: Any]? = nil) async throws {

        return try await withCheckedThrowingContinuation { continuation in
            session.request(
                baseUrl + endpoint,
                method: .put,
                parameters: body,
                headers: headers,
                requestModifier: { $0.timeoutInterval = self.timout }
            )
            .responseData { response in

                guard let status = response.response?.statusCode else {
                    continuation.resume(throwing: DVError.badResponse)
                    return
                }

                switch status {
                case 404:
                    continuation.resume(throwing: DVError.badUrl)
                case 400...499:
                    continuation.resume(throwing: DVError.forbidden)
                case 200...299:
                    switch response.result {
                    case .success:
                        continuation.resume()
                    case .failure:
                        continuation.resume(throwing: DVError.timout)
                    }

                default: continuation.resume(throwing: DVError.unknown)
                }
            }
        }
    }
}
