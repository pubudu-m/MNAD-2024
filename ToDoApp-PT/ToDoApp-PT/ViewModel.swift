//
//  ViewModel.swift
//  ToDoApp-PT
//
//  Created by Pubudu Mihiranga on 2024-10-05.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var myTasks: [TaskModel] = []
    
    func updateTask(task: TaskModel) {
        let index = myTasks.firstIndex(where: {
            $0.id == task.id
        })
        
        guard let unwrappedIndex = index else { return }
        
        myTasks[unwrappedIndex].isCompleted.toggle()
    }
}
