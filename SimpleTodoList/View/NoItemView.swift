//
//  NoItemView.swift
//  SimpleTodoList
//
//  Created by 승민 이 on 9/21/22.
//

import SwiftUI

struct NoItemView: View {
    @State var showAnimation: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
               Text("No items to display")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Please add new items")
                    .font(.title2)
                    .padding(.bottom, 20)
                
                NavigationLink {
                    AddTodoView()
                } label: {
                    Text("Add Something to do 🤗")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(showAnimation ? Color.red : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, showAnimation ? 30 : 50)
                .shadow(
                    color: showAnimation ? Color.red : Color.accentColor,
                    radius: showAnimation ? 30 : 10,
                    x: 0,
                    y: showAnimation ? 50 : 30)
                .scaleEffect(showAnimation ? 1.1 : 1.0)
                .offset(y: showAnimation ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !showAnimation else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                showAnimation.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .navigationTitle("Title")
        }
    }
}
