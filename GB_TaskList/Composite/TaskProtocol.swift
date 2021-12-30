//
//  TaskProtocol.swift
//  GB_TaskList
//
//  Created by Vitaliy Talalay on 30.12.2021.
//

import Foundation

protocol TaskProtocol {
    var name: String { get set }
    func countOfSubtasks() -> Int
    func description() -> String
}
