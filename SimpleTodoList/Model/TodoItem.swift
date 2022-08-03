//
//  TodoItem.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 7/28/22.
//

import Foundation

enum TodoStatus {
    case Pending, Completed, Overdue
}

struct TodoItem : Identifiable {
    let id: String
    let title: String
    let deadline: Date
    let status: TodoStatus
    
    init(id: String = UUID().uuidString, title: String, deadline: Date, status: TodoStatus) {
        self.id = id
        self.title = title
        self.deadline = deadline
        self.status = status
    }
}
