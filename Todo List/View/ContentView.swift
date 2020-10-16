//
//  ContentView.swift
//  Todo List
//
//  Created by Nguyen Bui Ly on 10/13/20.
//  Copyright © 2020 Nguyen Bui Ly. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SortPickerView(viewModel: viewModel)
                TodoListView(viewModel: viewModel)
            }
            .modifier(ContentViewModifier(viewModel: viewModel))
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
