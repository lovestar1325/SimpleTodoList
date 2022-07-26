//
//  TodoItem.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 7/28/22.
//

import Foundation

enum TodoStatus : Codable {
    case pending
    case completed
    case overdue
}

struct TodoItem : Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let deadline: Date
    let status: TodoStatus
    
    init(id: String = UUID().uuidString, title: String, description: String, deadline: Date, status: TodoStatus) {
        self.id = id
        self.title = title
        self.description = description
        self.deadline = deadline
        self.status = status
    }
    func completeStatus(todoItem: TodoItem) -> TodoItem {
        return TodoItem(id: id, title: todoItem.title, description: todoItem.description, deadline: todoItem.deadline, status: .completed)
    }
    func updateItem(todoItem: TodoItem) -> TodoItem {
        return TodoItem(id: id, title: todoItem.title, description: todoItem.description, deadline: todoItem.deadline, status: todoItem.status)
    }
}
