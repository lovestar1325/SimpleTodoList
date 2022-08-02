//
//  TodoItemRowView.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 8/2/22.
//

import SwiftUI

struct TodoItemRowView: View {
    var todoItem: TodoItem
    var body: some View {
        HStack {
            Text(todoItem.title)
        }
//        .frame(height: 55)
    }
}

struct TodoItemRowView_Previews: PreviewProvider {
    static var todoVm:TodoListViewModel = TodoListViewModel()
    
    static var previews: some View {
        NavigationView {
            TodoItemRowView(todoItem: todoVm.todoList[0])
            
        }
        .environmentObject(todoVm)
        .previewLayout(.sizeThatFits)
        
    }
}
