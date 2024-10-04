//
//  ContentView.swift
//  ToDoApp
//
//  Created by Pubudu Mihiranga on 2024-10-04.
//

import SwiftUI

struct TaskItem: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var isComplete: Bool
}

struct ContentView: View {
    @State var tasks: [TaskItem] = []
    @State var displayAddNewTask: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List(tasks) { task in
                    HStack {
                        Image(systemName: task.isComplete ? "circle.fill" : "circle")
                        
                        VStack(alignment: .leading) {
                            Text(task.title)
                            Text(task.description)
                        }
                    }
                    .onTapGesture {
                        let index = tasks.firstIndex(where: {
                            $0.id == task.id
                        })
                        
                        guard let unwrappedIndex = index else { return }
                        
                        tasks[unwrappedIndex].isComplete.toggle()
                    }
                }
            }
            .navigationTitle("My Tasks")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        displayAddNewTask.toggle()
                    }
                }
            }
            .sheet(isPresented: $displayAddNewTask) {
                AddNewTask(tasks: $tasks)
            }
        }
    }
}

struct AddNewTask: View {
    @State var title: String = ""
    @State var description: String = ""
    
    @Binding var tasks: [TaskItem]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                    .autocorrectionDisabled()
                
                TextField("Description", text: $description)
                    .autocorrectionDisabled()
            }
            .navigationTitle("New Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.red)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        let newTask = TaskItem(title: title,
                                               description: description,
                                               isComplete: false)
                        tasks.append(newTask)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
