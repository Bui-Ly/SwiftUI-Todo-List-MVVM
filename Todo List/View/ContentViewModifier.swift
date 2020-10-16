//
//  ContentViewModifier.swift
//  Todo List
//
//  Created by Nguyen Bui Ly on 10/14/20.
//  Copyright © 2020 Nguyen Bui Ly. All rights reserved.
//

import SwiftUI

struct ContentViewModifier: ViewModifier {
    @ObservedObject var viewModel: ViewModel
    
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("My Todo's")
            .navigationBarItems(trailing:
                HStack {
                    EditButton()
                        .disabled(viewModel.todos.isEmpty)
                    
                    Spacer().frame(width: 20)
                    
                    Button(action: {
                        self.viewModel.isPresented.toggle()
                    } ) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                .sheet(isPresented: $viewModel.isPresented) {
                    AddTodoView(viewModel: self.viewModel)
                }
        )
    }
}

