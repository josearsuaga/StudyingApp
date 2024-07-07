//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 07/07/24.
//

import Foundation

enum PersistenceError: Error {
    case fileDirectoryUnavailable
    case saveDataFailed
    case fetchDataFailed
    case encodingError
    case decodingerror
    case removingFailed
}
