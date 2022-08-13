//
//  TodoListView.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 7/28/22.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var todoVm :TodoListViewModel
    
    @State private var showPending: Bool = true
    @State private var showCompleted: Bool = true
    @State private var showOverdue: Bool = true
    @State private var showEditView: Bool = false
    
    
    var body: some View {
        
        VStack{
            categoryesView(showPending: $showPending, showCompleted: $showCompleted, showOverdue: $showOverdue)
            
            
            List {
                ForEach (todoVm.todoList) { todoItem in
                    if (todoItem.status == .Completed && showCompleted) ||
                        (todoItem.status == .Pending && showPending) ||
                        (todoItem.status == .Overdue && showOverdue) {
                         
                        NavigationLink{
                            EditTodoView(todoItem: todoItem)
                        } Label : {
                            TodoItemRowView(todoItem: todoItem),
                        }
                        
                        
                    }
                }
                .onDelete(perform: todoVm.deleteItem)
                .onMove(perform: todoVm.moveItem)
//                .sheet(isPresented: $showEditView) {
//
//                } content: {
//                    EditTodoView()
//                }

                
            }
//            .navigationBarItems(
//                leading: EditButton(),
//                trailing:
//                    NavigationLink("+", destination: {
//                        AddTodoView()
//                    })
//                )
        }
        .navigationTitle("Todo List")
    }
    
}


struct TodoListView_Previews: PreviewProvider {
    static var vm:TodoListViewModel = TodoListViewModel()
    
    static var previews: some View {
        NavigationView{
            TodoListView()
        }
        .environmentObject(vm)
    }
}

struct categoryesView: View {
    @Binding var showPending: Bool
    @Binding var showCompleted: Bool
    @Binding var showOverdue: Bool
    var body: some View {
        
        HStack {
            Button {
                showCompleted.toggle()
            } label: {
                Image(systemName: showCompleted ? "checkmark.square" : "square")
                Text("Pending")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.red)
            
            
            
            Button {
                showPending.toggle()
            } label: {
                Image(systemName: showPending ? "checkmark.square" : "square")
                Text("Completed")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.green)
            
            
            Button {
                showOverdue.toggle()
            } label: {
                Image(systemName: showOverdue ? "checkmark.square" : "square")
                Text("Overdue")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.blue)
            
        }
    }
}
