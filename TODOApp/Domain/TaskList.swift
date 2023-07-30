//
//  TaskList.swift
//  TODOApp
//
//  Created by cw-ryu.nakayama on 2023/07/30.
//

import Foundation

struct TaskList {
    let items: [TaskItem]

    init(items: [TaskItem]) {
        self.items = items
    }

    func add(item: TaskItem) -> TaskList {
        let newItems = self.items + [item]
        return TaskList(items: newItems)
    }

    func delete(id: UUID) -> TaskList {
        let newItems = self.items.filter { taskItem in
            taskItem.id != id
        }
        return TaskList(items: newItems)
    }

    func chageStatus(id: UUID, to status: TaskItem.TaskStatus) -> TaskList {
        let newItems = self.items.map { taskItem in
            if taskItem.id != id {
                return taskItem
            }

            return taskItem.changeStatus(to: status)
        }

        return TaskList(items: newItems)
    }
}
