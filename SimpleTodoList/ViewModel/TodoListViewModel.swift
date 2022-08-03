//
//  TodoListViewModel.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 8/2/22.
//

import Foundation
import SwiftUI

class TodoListViewModel : ObservableObject {
    private var editIndex: Int?
    
    @Published var todoList: [TodoItem] = [
        TodoItem(id: UUID().uuidString, title: "Job1", deadline: Date(), status: TodoStatus.Pending),
        TodoItem(id: UUID().uuidString, title: "Job2", deadline: Date(), status: TodoStatus.Completed)
    ]
    
    func getItems() {
        
    }
    
    func addItem(todoItem: TodoItem) {
        todoList.append(todoItem)
    }
    
    func deleteItem(indexSet: IndexSet) {
        todoList.remove(atOffsets: indexSet)
    }
    
    func moveItem(fromIndex: IndexSet, toIndex: Int) {
        todoList.move(fromOffsets: fromIndex, toOffset: toIndex)
    }
    
    func setEditIndex(todoItem: TodoItem) {
        editIndex = todoList.firstIndex(where: {todoItem.id == $0.id })
    }
    func editItem(todoItem: TodoItem) {
        guard let index = editIndex else { return }
        
//        let index = todoList.firstIndex(where: {todoItem.id == $0.id })
        
    }
    
}
