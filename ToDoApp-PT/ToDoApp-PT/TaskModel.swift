//
//  TaskModel.swift
//  ToDoApp-PT
//
//  Created by Pubudu Mihiranga on 2024-10-05.
//

import Foundation

struct TaskModel: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var isCompleted: Bool = false
}
