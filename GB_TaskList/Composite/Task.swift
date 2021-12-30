//
//  Task.swift
//  GB_TaskList
//
//  Created by Vitaliy Talalay on 30.12.2021.
//

import Foundation

class Task: TaskProtocol {
    var name: String
    var tasks: [TaskProtocol] = []

    init(_ name: String) {
        self.name = name
    }

    func countOfSubtasks() -> Int {
        tasks.count
    }

    func description() -> String {
        let count = countOfSubtasks() + tasks.compactMap {
            $0.countOfSubtasks() }.reduce(0, +)
        return "\(count)"
    }
}
