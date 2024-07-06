//
//  File.swift
//
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import Foundation
import Combine

public struct NetworkManager: Networkable {
    
    func sendRequest<T>(endpoint: any EndPoint) async throws -> T where T : Decodable {
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
}

