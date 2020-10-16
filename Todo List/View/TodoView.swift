//
//  TodoView.swift
//  Todo List
//
//  Created by Nguyen Bui Ly on 10/14/20.
//  Copyright © 2020 Nguyen Bui Ly. All rights reserved.
//

import SwiftUI

struct TodoView: View {
    
    var todo: Todo
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Name: ")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(todo.name)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Date: ")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(dateFormat(from: todo.date))
                }
            }
            
            Text("Target: ")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(todo.target)
                .italic()
        }
        .padding(10)
        .background(todo.priority.color.opacity(0.15))
        .cornerRadius(10)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(todo.priority.color, lineWidth: 0.7)
                .shadow(color: todo.priority.color, radius: 0.7)
        )
    }
    
    // MARK: -func
    func dateFormat(from date: Date) -> String {
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .long
        
        return formatter1.string(from: date)
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(todo: Todo(id: "", name: "Some name", target: "target", date: Date(), priority: .normal))
    }
}
