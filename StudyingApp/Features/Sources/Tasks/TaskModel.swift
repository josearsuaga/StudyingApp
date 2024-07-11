//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 10/07/24.
//

import Foundation

public struct TaskModel: Identifiable {
   public let id: UUID = UUID()
   public let title: String
   public var isDone: Bool = false
    
    init(title: String) {
        self.title = title        
    }
    
    mutating func taskIsDone() {
        isDone.toggle()
    }
}
