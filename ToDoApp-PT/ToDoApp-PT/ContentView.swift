//
//  ContentView.swift
//  ToDoApp-PT
//
//  Created by Pubudu Mihiranga on 2024-10-05.
//

import SwiftUI

struct TaskModel: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var isCompleted: Bool = false
}

struct ContentView: View {
    @State var myTasks: [TaskModel] = []
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if myTasks.isEmpty {
                    ContentUnavailableView("No Tasks",
                                           systemImage: "tray",
                                           description: Text("Add your first task by clicking on + icon above"))
                } else {
                    List(myTasks) { task in
                        HStack {
                            Image(systemName: task.isCompleted ? "circle.fill" : "circle")
                            
                            VStack(alignment: .leading) {
                                Text(task.title)
                                Text(task.description)
                            }
                        }
                        .onTapGesture {
                            let index = myTasks.firstIndex(where: {
                                $0.id == task.id
                            })
                            
                            guard let unwrappedIndex = index else { return }
                            
                            myTasks[unwrappedIndex].isCompleted.toggle()
                        }
                    }
                }
            }
            .navigationBarTitle("ToDo App")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        showSheet = true
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                NewTaskView(myTasks: $myTasks)
            }
        }
    }
}

#Preview {
    ContentView()
}
