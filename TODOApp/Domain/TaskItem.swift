//
//  TaskItem.swift
//  TODOApp
//
//  Created by ryu.nakayama on 2023/07/30.
//

import Foundation

struct TaskItem: Identifiable {
    let id: UUID
    let content: String
    let status: TaskStatus
    let createdAt: Date

    func changeStatus(to status: TaskStatus) -> TaskItem {
        TaskItem(id: id, content: content, status: status, createdAt: createdAt)
    }

    enum TaskStatus {
        case todo
        case done
    }
}
