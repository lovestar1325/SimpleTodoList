//
//  EditTodoView.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 7/28/22.
//

import SwiftUI

struct EditTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    
//    @State var todoItem: TodoItem
    var body: some View {
        VStack {
            Text("Title")
            Text("Description")
            Text("Deadline")
            
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
            .frame(height: 55)
            


        }
    }
}

struct EditTodoView_Previews: PreviewProvider {
    static var vm:TodoListViewModel = TodoListViewModel()
    
    static var previews: some View {
        NavigationView{
            EditTodoView()
        }
     }
}
