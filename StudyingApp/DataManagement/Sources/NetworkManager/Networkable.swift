//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import Foundation
import Combine

protocol Networkable {
    func sendRequest<T: Decodable>(endpoint: EndPoint) async throws -> T
}

extension Networkable {
    func createRequest(endPoint: EndPoint) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.path
        guard let url = urlComponents.url else {
            return nil
        }
        let encoder = JSONEncoder()
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        request.allHTTPHeaderFields = endPoint.header
        if let body = endPoint.body {
            request.httpBody = try? encoder.encode(body)
        }
        return request
    }
}
