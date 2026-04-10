//
//  Task.swift
//  T0DO
//
//  Created by Sós Dávid on 2026. 04. 10..
//

import Foundation

struct ToDoTask : Identifiable {
    let id = UUID()
    var title: String
    var isChecked: Bool = false
}
