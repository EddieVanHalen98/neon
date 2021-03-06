//
//  CurrentToDoListView.swift
//  NeonWidgetExtension
//
//  Created by James Saeed on 07/10/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct CurrentToDoListView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let todos: [ToDoItem]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if colorScheme == .dark {
                Color("DarkWidgetBackgroundColor")
            } else {
                LinearGradient(gradient: Gradient(colors: [Color("GradientEnd"), Color("UrgentColor")]),
                               startPoint: .top,
                               endPoint: .bottom)
            }
            
            Group {
                if !todos.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(todos) { todo in
                            Text("• " + todo.title)
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                        }
                    }
                } else {
                    Text("Your to do list is empty")
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                }
            }.padding(16)
            .foregroundColor(.white)
        }
    }
}

struct PlaceholderCurrentToDoListView: View {
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(gradient: Gradient(colors: [Color("GradientEnd"), Color("UrgentColor")]),
                           startPoint: .top,
                           endPoint: .bottom)
            VStack(alignment: .leading, spacing: 4) {
                Text("Clear out fridge.")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .redacted(reason: .placeholder)
                Text("Tidy room.")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .redacted(reason: .placeholder)
            }.padding(16)
            .foregroundColor(.white)
        }
    }
}

struct CurrentToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentToDoListView(todos: [])
    }
}
