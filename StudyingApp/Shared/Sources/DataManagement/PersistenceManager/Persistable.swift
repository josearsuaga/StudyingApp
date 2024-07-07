//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 07/07/24.
//

import Foundation

protocol Persistable {
    func saveData<T: Codable>(data: T) async throws
    func fetchData<T: Decodable>() async throws -> T
}
