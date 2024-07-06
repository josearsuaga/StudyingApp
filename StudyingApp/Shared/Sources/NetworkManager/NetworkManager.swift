//
//  File.swift
//
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import Foundation
import Combine

public struct NetworkManager: Networkable {
    
    public init() {
        
    }
    
   public func sendRequest<T>(endpoint: any EndPoint) async throws -> T where T : Decodable {
        guard let urlRequest = createRequest(endPoint: endpoint) else {
            throw NetworkError.invalidURL
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                    guard response is HTTPURLResponse else {
                        continuation.resume(throwing: NetworkError.invalidURL)
                        return
                    }
                    guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                        continuation.resume(throwing: NetworkError.unexpectedStatusCode)
                        return
                    }
                    guard let data = data else {
                        continuation.resume(throwing: NetworkError.unknownError)
                        return
                    }
                    guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                        continuation.resume(throwing: NetworkError.errorDecodingResponse)
                        return
                    }
                    continuation.resume(returning: decodedResponse)
                }
            task.resume()
        }
    }
    
    public func sendRequest<T>(for url: URL) async throws -> T where T : Decodable {
         let urlRequest = URLRequest(url: url)
         return try await withCheckedThrowingContinuation { continuation in
             let task = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                     guard response is HTTPURLResponse else {
                         continuation.resume(throwing: NetworkError.invalidURL)
                         return
                     }
                     guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                         continuation.resume(throwing: NetworkError.unexpectedStatusCode)
                         return
                     }
                     guard let data = data else {
                         continuation.resume(throwing: NetworkError.unknownError)
                         return
                     }
                     guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                         continuation.resume(throwing: NetworkError.errorDecodingResponse)
                         return
                     }
                     continuation.resume(returning: decodedResponse)
                 }
             task.resume()
         }
     }
}

public struct NetworkManagerMock: Networkable {
    
    let error: NetworkError?
    let data: Data?
    
    public func sendRequest<T>(endpoint: any EndPoint) async throws -> T where T : Decodable {
        if let data,
           let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
            return decodedResponse
        }
        throw error ?? .unknownError
    }
    
    func sendRequest<T>(for url: URL) async throws -> T where T : Decodable {
        if let data,
           let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
            return decodedResponse
        }
        throw error ?? .unknownError
    }
}

