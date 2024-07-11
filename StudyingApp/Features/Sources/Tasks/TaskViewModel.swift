//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 10/07/24.
//

import Foundation

public final class TaskViewModel:ObservableObject {
    
    @Published var tasks: [TaskModel] = [] 
    @Published var showCompletedTasks: Bool = false {
        didSet {
            if showCompletedTasks {
                allTasks = tasks
                tasks = allTasks.filter( { $0.isDone })
            } else {
                tasks = allTasks
            }
        }
    }
    
    private var allTasks: [TaskModel] = []
    
    public init() {}
    
    public func createNewTask(title: String) {
        tasks.append(TaskModel(title: title))
    }
    
    public func completeTask(for task: TaskModel) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isDone.toggle()
    }
    
    public func deleteTask(at offsets: IndexSet) {
        for offset in offsets {
            let task = tasks[offset]
            guard let indexToRemove = allTasks.firstIndex(where: { $0.id == task.id} ) else { continue }
            allTasks.remove(at: indexToRemove)
        }        
        tasks.remove(atOffsets: offsets)
    }
    
}
