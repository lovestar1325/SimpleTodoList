//
//  AddTodoView.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 7/28/22.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoVm: TodoListViewModel
    @State var newTodoTitle: String = ""
    @State var newTodoDescription: String = ""
    @State var newTodoDeadline: Date = Date()
    
    
    var body: some View {
        VStack {
           HStack {
                Text("Title : ").font(.title).padding(.horizontal)
                Spacer()
            }
            TextField("Enter new todo title", text: $newTodoTitle)
                .padding()
                .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
             
            HStack {
                Text("Description").font(.title).padding(.horizontal)
                Spacer()
            }
            TextField("description here...", text: $newTodoDescription)
                .padding()
                .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                
        
            HStack {
                Text("Deadline").font(.title).padding(.horizontal)
                Spacer()
            }
//            HStack {
//                Slider("date") {
//                    
//                }
//                Slider("time") {
//                    
//                }
//            }
        
 /*
 @State private var date = Date()
 let dateRange: ClosedRange<Date> = {
     let calendar = Calendar.current
     let startComponents = DateComponents(year: 2021, month: 1, day: 1)
     let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
     return calendar.date(from:startComponents)!
         ...
         calendar.date(from:endComponents)!
 }()

 var body: some View {
     DatePicker(
         "Start Date",
          selection: $date,
          in: dateRange,
          displayedComponents: [.date, .hourAndMinute]
     )
 }*/
            
//            DatePicker("", selection: $newTodoDeadline)
//                .datePickerStyle(.wheel)
//                .offset(x: -20, y: -40)

            HStack {
                Button {
                    addTodoItem()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Confirm")
                        .padding()
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .padding()
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                }
        
            }
            Spacer()
        }
        .navigationTitle("New Todo Thing")
        
    }
    
    func addTodoItem() {
        let todoItem = TodoItem(title: newTodoTitle, description: newTodoDescription, deadline: newTodoDeadline, status: .Pending)
        todoVm.addItem(todoItem: todoItem)
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var vm:TodoListViewModel = TodoListViewModel()
    
    static var previews: some View {
        NavigationView {
            AddTodoView()
        }
        .environmentObject(vm)
    }
}
