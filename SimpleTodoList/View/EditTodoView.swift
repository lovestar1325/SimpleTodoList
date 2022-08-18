//
//  EditTodoView.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 7/28/22.
//

import SwiftUI

struct EditTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoVm: TodoListViewModel
    @State var todoItem: TodoItem
    
    @State var newTitle: String = ""
    @State var newDescription: String = ""
    @State var targetDate: Date
    
    
    var body: some View {
        
        VStack {
            TextField(newTitle, text: $newTitle)
                .padding()
                .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))

            TextField(todoItem.description, text: $newDescription)
                .padding()
                .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        
        
            
            DatePicker(selection: $targetDate, displayedComponents: [.date, .hourAndMinute]) {
                Text("Todo until")
            }
            .padding()
            
            
            HStack{
                Spacer()
                Button {
                    
                } label: {
                    Text("Confirm")
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                Button {
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Text("Complete")
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                Spacer()
            }
 
            Spacer()
        }
        .navigationTitle("Edit Todo Item")
    }

}

struct EditTodoView_Previews: PreviewProvider {
    static var item = TodoItem(title: "Test Job", description: "This is something detail", deadline: Date(), status: .overdue)
    
    static var previews: some View {
        NavigationView{
            EditTodoView(todoItem: item, targetDate: item.deadline)
//            EditTodoView()
        }
//        .environmentObject(vm)
     }
}
