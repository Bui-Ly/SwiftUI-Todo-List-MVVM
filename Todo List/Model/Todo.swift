//
//  Model.swift
//  Todo List
//
//  Created by Nguyen Bui Ly on 10/13/20.
//  Copyright © 2020 Nguyen Bui Ly. All rights reserved.
//

import Foundation
import SwiftUI

struct Todo: Identifiable, Equatable {
    var id: String = UUID().uuidString
    let name: String
    let target: String
    let date: Date
    let priority: Priority
}

enum Priority: Int, Identifiable, CaseIterable {
    var id: Int { rawValue }
    case normal, medium, high
    var title: String {
        switch self {
        case .normal:
            return "Normal"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
    var color: Color {
        switch self {
        case .normal:
            return .blue
        case .medium:
            return .orange
        case .high:
            return .red
        }
    }
}

enum SortType: String, Identifiable, CaseIterable {
    var id: String { rawValue }
    case order, date, priority
}
