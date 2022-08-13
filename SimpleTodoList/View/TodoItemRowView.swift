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
        VStack {
            Text(todoItem.title)
            HStack {
                Text(todoItem.description)
                Text(todoItem.deadline.description)
            }
        }
    }
}

struct TodoItemRowView_Previews: PreviewProvider {
    static var item = TodoItem(title: "Test Job", description: "This is something detail", deadline: Date(), status: .Overdue)
   
    static var previews: some View {
        NavigationView {
            TodoItemRowView(todoItem: item)
//            TodoItemRowView()
            
        }
        .previewLayout(.sizeThatFits)
        
    }
}
