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
        let dateString = getDateString()
        
        VStack (alignment: .leading) {
            Text(todoItem.title)
                .font(.title)
            HStack {
                Text(todoItem.description)
                    .font(.caption)
                Spacer()
                Text(dateString)
            }
        }
    }
    private func getDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: todoItem.deadline)
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
