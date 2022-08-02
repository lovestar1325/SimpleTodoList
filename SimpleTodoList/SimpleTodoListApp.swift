//
//  SimpleTodoListApp.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 7/26/22.
//

import SwiftUI

@main
struct SimpleTodoListApp: App {
    @StateObject var todoVm = TodoListViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView {
                TodoListView()
            }
            .environmentObject(todoVm)
        }
    }
}
