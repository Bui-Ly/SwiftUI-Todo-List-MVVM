//
//  ViewModel.swift
//  Todo List
//
//  Created by Nguyen Bui Ly on 10/14/20.
//  Copyright © 2020 Nguyen Bui Ly. All rights reserved.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var todos: [Todo] = [Todo]()
    @Published var sortType: SortType = .order {
        didSet {
            withAnimation(.some(.linear)) {
                self.sort()
            }
            //self.sort()
            
            print("sort type: \(sortType)")
        }
    }
    @Published var isPresented = false
    
    func addTodo(_ todo: Todo) {
        DispatchQueue.main.async {
            self.todos.append(todo)
        }
    }
    
    func removeTodo(_ indexSet: IndexSet) {
        self.todos.remove(atOffsets: indexSet)
    }
    
    func sort() {
        switch self.sortType {
        case .order:
            todos.sort(by: { $0.name < $1.name})
        case .date:
            todos.sort(by: { $0.date > $1.date})
        case .priority:
            todos.sort(by: { $0.priority.rawValue > $1.priority.rawValue})
        }
    }
}
