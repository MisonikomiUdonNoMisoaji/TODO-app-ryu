//
//  TaskListViewModel.swift
//  TODOApp
//
//  Created by ryu.nakayama on 2023/07/30.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var taskList: TaskList = .init(items: [])
    @Published var inputContent: String = ""

    func todoTaskList() -> [TaskItem] {
        taskList.items.filter { taskItem in
            taskItem.status == .todo
        }
    }

    func doneTaskList() -> [TaskItem] {
        taskList.items.filter { taskItem in
            taskItem.status == .done
        }
    }

    private let useCase = TaskListUseCase.self

    func onTapCreateButton() {
        taskList = useCase.createTaskItem(content: inputContent, taskList: taskList)
    }

    func onTapDoneButton(id: UUID) {
        taskList = useCase.completeTask(id: id, taskList: taskList)
    }

    func onTapTodoButton(id: UUID) {
        taskList = useCase.uncompleteTask(id: id, taskList: taskList)
    }
}
