//
//  TodoListView.swift
//  Todo List
//
//  Created by Nguyen Bui Ly on 10/14/20.
//  Copyright © 2020 Nguyen Bui Ly. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List {
            Section {
            ForEach(self.viewModel.todos) { todo in
                NavigationLink(destination: Text(todo.name)) {
                    TodoView(todo: todo)
                    
                }
            }
                 .onDelete { self.viewModel.removeTodo($0)}
            }
           
        }
        .listStyle(GroupedListStyle())
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(viewModel: ViewModel())
    }
}
