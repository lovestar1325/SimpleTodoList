//
//  AddTodoView.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 7/28/22.
//

import SwiftUI

struct AddTodoView: View {
    @State var newTodoTitle: String = ""
    @State var newTodoDescription: String = ""
    @State var newTodoDeadline: Date = Date()
    
    var body: some View {
        VStack {
            TextField("Enter new todo title", text: $newTodoTitle)
            TextField("description here...", text: $newTodoDescription)
            DatePicker("Deadline", selection: $newTodoDeadline)
                .datePickerStyle(.wheel)
            
            HStack {
                Button {
                     
                } label: {
                    Text("Confirm")
                }
                Button {
                     
                } label: {
                    Text("Cancel")
                }

            }
        }
        
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTodoView()
        }
    }
}
