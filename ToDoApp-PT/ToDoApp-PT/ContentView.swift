//
//  ContentView.swift
//  ToDoApp-PT
//
//  Created by Pubudu Mihiranga on 2024-10-05.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.myTasks.isEmpty {
                    ContentUnavailableView("No Tasks",
                                           systemImage: "tray",
                                           description: Text("Add your first task by clicking on + icon above"))
                } else {
                    List(viewModel.myTasks) { task in
                        HStack {
                            Image(systemName: task.isCompleted ? "circle.fill" : "circle")
                            
                            VStack(alignment: .leading) {
                                Text(task.title)
                                Text(task.description)
                            }
                        }
                        .onTapGesture {
                            viewModel.updateTask(task: task)
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
                NewTaskView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
