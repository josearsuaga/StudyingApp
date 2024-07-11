//
//  SwiftUIView.swift
//  
//
//  Created by José Arsuaga Sotres on 10/07/24.
//

import SwiftUI

public struct TasksView: View {
    @ObservedObject var viewModel: TaskViewModel
    @State var presentingAlert: Bool = false
    @State var taskName: String = ""
    public init(viewModel: TaskViewModel) {
        self.viewModel = viewModel
    }
    public var body: some View {
        VStack {
            List {
                ForEach(viewModel.tasks) { task in
                    createTaskRow(for: task)
                }
                .onDelete(perform: deleteTask)
                
            }
            HStack(spacing: 16) {
                Toggle(isOn: $viewModel.showCompletedTasks) {
                    if viewModel.showCompletedTasks {
                        Text("Showing completed tasks")
                    } else {
                        Text("Showing uncompleted tasks")
                    }
                    
                }
                
                Button("New task") {
                    presentingAlert = true
                }.buttonStyle(.borderedProminent)
                
            }.padding(.horizontal)
        }.sheet(isPresented: $presentingAlert) {
            createCustomAlert()
        }
                
    }
    
    private func deleteTask(at offsets: IndexSet) {
            viewModel.deleteTask(at: offsets)
        }
    
    @ViewBuilder
    func createTaskRow(for task: TaskModel) -> some View {
        HStack {
            Text(task.title)
            Spacer()
            if !task.isDone {
                Button("Complete task") {
                    viewModel.completeTask(for: task)
                }
            }
        }
    }
    
    @ViewBuilder
    func createCustomAlert() -> some View {
        VStack {
            Text("Enter task name")
            TextField("Type something...", text: $taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            HStack {
                Button("Cancel") {
                    presentingAlert = false
                }
                Spacer()
                Button("OK") {
                    presentingAlert = false
                    viewModel.createNewTask(title: taskName)
                }
            }
            .padding()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    TasksView(viewModel: TaskViewModel())
}
