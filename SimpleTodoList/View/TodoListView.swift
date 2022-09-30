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
        
    var body: some View {
        ZStack{
            if todoVm.todoList.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                VStack{
                    categoryesView(showPending: $showPending, showCompleted: $showCompleted, showOverdue: $showOverdue)

                    List {
                        ForEach (todoVm.todoList) { todoItem in

                            if checkShow(status: todoItem.status) {
                                    NavigationLink( destination: EditTodoView(todoItem: todoItem, targetDate: todoItem.deadline) ) {
                                        TodoItemRowView(todoItem: todoItem)
                                }
                            }
                        }
                        .onDelete(perform: todoVm.deleteItem)
                        .onMove(perform: todoVm.moveItem)
                    }
                    
                }
            }
            
        }
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add +", destination: AddTodoView())
        )
        .navigationTitle("Todo List")
        
    }
    private func checkShow(status : TodoStatus) -> Bool {
        switch status {
        case .pending:
            return showPending ? true : false
        case .completed:
            return showCompleted ? true : false
        case .overdue:
            return showOverdue ? true : false
        }
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
                showPending.toggle()
            } label: {
                Image(systemName: showPending ? "checkmark.square" : "square")
                Text("Pending")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.green)

            Button {
                showCompleted.toggle()
            } label: {
                Image(systemName: showCompleted ? "checkmark.square" : "square")
                Text("Completed")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.red)

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
