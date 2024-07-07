//
//  File.swift
//
//
//  Created by José Arsuaga Sotres on 07/07/24.
//

import Foundation
import Dependencies

public final class PersistenceManager: Persistable {
    
    public init() { }
    
    public func saveData<T>(data: T) async throws where T : Decodable, T : Encodable {
        guard let encodedData = try? JSONEncoder().encode(data) else {
            throw PersistenceError.encodingError
        }
        guard let fileDirectory = getFileDirectory() else {
            throw PersistenceError.fileDirectoryUnavailable
        }
        
        let fileName = "\(T.self).json"
        let fileURL = fileDirectory.appendingPathComponent(fileName)
        
        try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.global().async {
                do {
                    try encodedData.write(to: fileURL)
                    print("\(T.self) saved correctly on \(T.self).json on \(fileURL)")
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    public func fetchData<T: Decodable>() async throws -> T {
        guard let fileDirectory = getFileDirectory() else {
            throw PersistenceError.fileDirectoryUnavailable
        }
        let fileName = "\(T.self).json"
        let fileURL = fileDirectory.appendingPathComponent(fileName)
        
        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: fileURL)
                    continuation.resume(with: .success(try JSONDecoder().decode(T.self, from: data)))
                } catch {
                    continuation.resume(throwing: error)
                }
            }
            
        }
    }
    
    public func removeData<T>(data: T) async throws where T : Decodable, T : Encodable {
        guard let fileDirectory = getFileDirectory() else { throw PersistenceError.fileDirectoryUnavailable }
        let fileName = "\(T.self).json"
        let fileURL = fileDirectory.appendingPathComponent(fileName)
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            throw PersistenceError.removingFailed
        }
        
    }
        
    
    private func getFileDirectory() -> URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    
}

private enum PersistenceManagerKey: DependencyKey {
  static let liveValue: any Persistable = PersistenceManager()
  static let previewValue: any Persistable = PersistenceManager()
  static let testValue: any Persistable = PersistenceManager()
}

public extension DependencyValues {
    var persistenceManager: Persistable {
        get { self[PersistenceManagerKey.self] }
        set { self[PersistenceManagerKey.self] = newValue }
    }
}
