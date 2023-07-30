//
//  UseCase.swift
//  TODOApp
//
//  Created by cw-ryu.nakayama on 2023/07/30.
//

import Foundation

struct TaskListUseCase {
    static func createTaskItem(content: String, taskList: TaskList) -> TaskList {
        let newTaskItem = TaskItem(id: UUID(), content: content, status: .todo, createdAt: Date.now)
        return taskList.add(item: newTaskItem)
    }

    static func completeTask(id: UUID, taskList: TaskList) -> TaskList {
        return taskList.chageToDONE(id: id)
    }

    static func deleteTask(id: UUID, taskList: TaskList) -> TaskList {
        return taskList.delete(id: id)
    }
}
