//
//  NewTaskView.swift
//  ToDoApp-PT
//
//  Created by Pubudu Mihiranga on 2024-10-05.
//

import SwiftUI

struct NewTaskView: View {
    @Binding var myTasks: [TaskModel]
    
    @State var title: String = ""
    @State var description: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Title", text: $title)
                    
                    TextField("Description", text: $description)
                }
                .autocorrectionDisabled()
            }
            .navigationTitle("Add New Task")
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
                        let newTask = TaskModel(title: title,
                                                description: description)
                        myTasks.append(newTask)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NewTaskView(myTasks: .constant([]))
}
