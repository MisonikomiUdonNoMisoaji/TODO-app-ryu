//
//  TaskListViewModel.swift
//  TODOApp
//
//  Created by cw-ryu.nakayama on 2023/07/30.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var taskList: TaskList = .init(items: [])
    @Published var inputContent: String = ""

    private let useCase = TaskListUseCase.self

    func onTapCreateButton() {
        taskList = useCase.createTaskItem(content: inputContent, taskList: taskList)
    }

    func onTapCheckBox(checkBoxValue: Bool, id: UUID) {
        if checkBoxValue == true {
            taskList = useCase.completeTask(id: id, taskList: taskList)
        }

        // 完了 → 未完了になる場合はまだ考慮しない
    }
}
