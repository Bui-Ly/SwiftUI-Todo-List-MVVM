//
//  SortPickerView.swift
//  Todo List
//
//  Created by Nguyen Bui Ly on 10/14/20.
//  Copyright © 2020 Nguyen Bui Ly. All rights reserved.
//

import SwiftUI

struct SortPickerView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Picker("", selection: $viewModel.sortType) {
            ForEach(SortType.allCases) {
                Text($0.rawValue.capitalized).tag($0)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct SortPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SortPickerView(viewModel: ViewModel())
    }
}
