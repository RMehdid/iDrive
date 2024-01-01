//
//  NetworkManager.swift
//  iDrive
//
//  Created by Samy Mehdid on 1/1/2024.
//

import Foundation
import Alamofire

open class NetworkService {
    
    public static var shared = NetworkService()
    
    private var header: HTTPHeaders {
        get {
            return [
                "Content-Type": "application/json",
            ]
        }
    }
    
    private var baseUrl: String {
        return Bundle.main.object(forInfoDictionaryKey: "BaseUrl") as? String ?? ""
    }
    
    func get<Model: Decodable>(endpoint: String, query: [String: Any]? = nil, success: @escaping (Model) -> Void, failed: @escaping () -> Void){
        
        AF.request("\(baseUrl)\(endpoint)", method: .get, parameters: query, encoding: URLEncoding.queryString, headers: header).responseDecodable(of: Model.self) { response in
            
            debugPrint("http:res: \(response.debugDescription)")
            
            guard let status = response.response?.statusCode else {
                failed()
                return
            }
            
            switch status {
            case 200...299:
                switch response.result {
                case .success(let res):
                    success(res)
                case .failure(let error):
                    failed()
                }
            case 400...499:
                failed()
            default: failed()
            }
        }
    }
    
    public func post<Model: Decodable>(endpoint: String, body: [String: Any], success: @escaping (Model) -> Void, failed: @escaping () -> Void){
        
        AF.request("\(baseUrl)\(endpoint)", method: .post, parameters: body, headers: header).responseDecodable(of: Model.self, emptyResponseCodes: [200]) { response in
            
            debugPrint("http:res: \(response.debugDescription)")
            
            guard let status = response.response?.statusCode else {
                failed()
                return
            }
            
            switch status {
            case 200...299:
                switch response.result {
                case .success(let res):
                    success(res)
                case .failure(let error):
                    failed()
                }
            case 400...499:
                failed()
            default: failed()
            }
        }
    }
    
    public func put<Model: Decodable>(endpoint: String, body: [String: Any]? = nil, success: @escaping (Model?) -> Void, failed: @escaping () -> Void){
        
        AF.request("\(baseUrl)\(endpoint)", method: .put, parameters: body, encoding: JSONEncoding.default, headers: header).responseDecodable(of: Model.self, emptyResponseCodes: [200]) { response in
            
            guard let status = response.response?.statusCode else {
                failed()
                return
            }
            
            switch status {
            case 200...299:
                switch response.result {
                case .success(let res):
                    success(res)
                case .failure(let error):
                    failed()
                }
            case 400...499:
                failed()
            default: failed()
            }
        }
    }
}
