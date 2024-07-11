//
//  File.swift
//
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import Foundation
import Combine
import Dependencies

public struct NetworkManager: Networkable {
    
    
    public init() {
        
    }
    
    public func sendRequest<T>(endpoint: any EndPoint) async throws -> T where T : Decodable {
        guard let urlRequest = createRequest(endPoint: endpoint) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard response is HTTPURLResponse else {
            throw NetworkError.invalidURL
        }
        guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
            throw NetworkError.unexpectedStatusCode
        }
        guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.errorDecodingResponse
        }
        return decodedResponse
    }
    
    public func sendRequest<T>(for url: URL) async throws -> T where T : Decodable {
        let urlRequest = URLRequest(url: url)        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard response is HTTPURLResponse else {
            throw NetworkError.invalidURL
        }
        guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
            throw NetworkError.unexpectedStatusCode
        }
        guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.errorDecodingResponse
        }
        return decodedResponse
    }
}

public struct NetworkManagerMock: Networkable {
    
    public let error: NetworkError?
    public let data: Data?
    
    public init(error: NetworkError? = nil, data: Data? = nil) {
        self.error = error
        self.data = data
    }
    
    public func sendRequest<T>(endpoint: any EndPoint) async throws -> T where T : Decodable {
        if let data,
           let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
            return decodedResponse
        }
        throw error ?? .unknownError
    }
    
    public func sendRequest<T>(for url: URL) async throws -> T where T : Decodable {
        if let data,
           let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
            return decodedResponse
        }
        throw error ?? .unknownError
    }
}

private enum NetworkManagerKey: DependencyKey {
    static let liveValue: Networkable = NetworkManager()
    static let previewValue: Networkable = NetworkManagerMock()
    static let testValue: Networkable = NetworkManagerMock()
}

public extension DependencyValues {
    var networkManager: Networkable {
        get { self[NetworkManagerKey.self] }
        set { self[NetworkManagerKey.self] = newValue }
    }
}
