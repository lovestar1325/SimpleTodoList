//
//  TodoListViewModel.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 8/2/22.
//

import Foundation
import SwiftUI

class TodoListViewModel : ObservableObject {
    let todoListKey: String = "TodoListSaveKey"
    private var editIndex: Int?
    
    @Published var todoList: [TodoItem] = [] {
        didSet {
            saveTodoList()
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        guard
            let data = UserDefaults.standard.data(forKey: todoListKey),
            let savedData = try? JSONDecoder().decode([TodoItem].self, from: data)
        else { return }
        
        todoList = savedData
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
    
//    func getEditItem() -> TodoItem? {
//        if let index = editIndex {
//            return todoList[index]
//        } else {
//            return nil
//        }
//    }
    func editItem(todoItem: TodoItem) {
        guard let index = todoList.firstIndex(where: {$0.id == todoItem.id}) else { return}
        let newTodoItem = todoItem.updateItem(todoItem: todoItem)
        todoList[index] = newTodoItem
//        guard let index = editIndex else { return }
        
//        let index = todoList.firstIndex(where: {todoItem.id == $0.id })
        
    }
    
    
    func completeStatus(todoItem: TodoItem) {
        guard let index = todoList.firstIndex(where: {$0.id == todoItem.id }) else { return }
        
        let newTodoItem = todoItem.completeStatus(todoItem: todoItem)
        todoList[index] = newTodoItem
    }
    
    func saveTodoList() {
        if let data = try? JSONEncoder().encode(todoList) {
            UserDefaults.standard.set(data, forKey: todoListKey)
        }
    }
    
}
