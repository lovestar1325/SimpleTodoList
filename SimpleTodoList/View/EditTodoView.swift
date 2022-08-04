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
    @State var newTitle: String = ""
    @State var newDescription: String = ""
    @State var newDeadline: Date = Date()
    
    init() {
        if let todoItem = todoVm.getEditItem() {
            newTitle = todoItem.title
            newDescription = todoItem.description
            newDeadline = todoItem.deadline
        }
        
    }

    var body: some View {
        
        
        
        VStack {
            TextField(newTitle, text: $newTitle)
                .padding()
                .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            TextField(newDescription, text: $newDescription)
                .padding()
                .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
//            TextField(newData.rawValue.description,)
//                .padding()
//                .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
//                .cornerRadius(10)
//                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            
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
        .navigationTitle("Edit Toto Item")
    }
}

struct EditTodoView_Previews: PreviewProvider {
    static var vm:TodoListViewModel = TodoListViewModel()
    
    static var previews: some View {
        NavigationView{
            EditTodoView()
        }
        .environmentObject(vm)
     }
}
