//
//  EditTodoView.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 7/28/22.
//

import SwiftUI

struct myButtonViewModifier: ViewModifier {
    @State var color: Color = Color.blue
    func body(content: Content) -> some View {
        content
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(10)
            
    }
}


struct EditTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoVm: TodoListViewModel
    @State var todoItem: TodoItem
    
    @State var newTitle: String = ""
    @State var newDescription: String = ""
    @State var targetDate: Date
    
    
    var body: some View {
        
        VStack {
            TextField(todoItem.title, text: $newTitle)
                .padding()
                .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))

            TextField(todoItem.description, text: $newDescription)
                .padding()
                .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        
            DatePicker("todo until: ", selection: $targetDate, displayedComponents: [.date, .hourAndMinute])
                .padding()
            
            
            HStack{
                Button {
                    todoVm.editItem(todoItem: makeNewItem())
                    closeView()
                } label: {
                    Text("Confirm")
                        .modifier(myButtonViewModifier())
                }
                
                Button("Cancel", action: closeView)
                    .modifier(myButtonViewModifier(color: Color.red))

                Button {
                    todoVm.completeStatus(todoItem: todoItem)
                    closeView()
                } label: {
                    Text("Complete")
                        .modifier(myButtonViewModifier(color: Color.green))
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("Edit Todo Item")
    }
    
    private func closeView() {
        presentationMode.wrappedValue.dismiss()
    }

    private func setTargetDate() {
        targetDate = todoItem.deadline
    }
    
    private func makeNewItem() -> TodoItem {
        let title = newTitle.isEmpty ? todoItem.title : newTitle
        let description = newDescription.isEmpty ? todoItem.description : newDescription
        
        return TodoItem(id: todoItem.id, title: title, description: description, deadline: targetDate, status: todoItem.status)
    }
}

struct EditTodoView_Previews: PreviewProvider {
    static var item = TodoItem(title: "Test Job", description: "This is something detail", deadline: Date(), status: .overdue)
    
    static var previews: some View {
        NavigationView{
            EditTodoView(todoItem: item, targetDate: item.deadline)
        }
    }
}
