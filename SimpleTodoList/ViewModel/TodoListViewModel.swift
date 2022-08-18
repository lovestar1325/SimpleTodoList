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
    
    @Published var todoList: [TodoItem] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let item1 = TodoItem(title: "Job1", description: "Detail 1", deadline: Date(), status: .pending)
        let item2 = TodoItem(title: "Job2", description: "Detail 2", deadline: Date(), status: .completed)
        let item3 = TodoItem(title: "Job3", description: "Detail 3", deadline: Date(), status: .overdue)
    
        todoList.append(contentsOf: [item1, item2, item3])
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
    
    func getEditItem() -> TodoItem? {
        if let index = editIndex {
            return todoList[index]
        } else {
            return nil
        }
    }
    func editItem(todoItem: TodoItem) {
//        guard let index = editIndex else { return }
        
//        let index = todoList.firstIndex(where: {todoItem.id == $0.id })
        
    }
    func updateStatus(todoItem: TodoItem) {
        guard let index = todoList.first(where: {$0.id == todoItem.id}) else { return }
        todoList[index].updateStatus(status: TodoStatus)
    }
    
}
