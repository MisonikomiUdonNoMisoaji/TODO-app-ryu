//
//  TaskListView.swift
//  TODOApp
//
//  Created by cw-ryu.nakayama on 2023/07/30.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel: TaskListViewModel = .init()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField(text: $viewModel.inputContent) {
                        Text("内容を入力してください")
                    }
                    .textFieldStyle(.roundedBorder)

                    Button {
                        viewModel.onTapCreateButton()
                    } label: {
                        Text("作成")
                    }

                }
                .padding()

                List {
                    ForEach(viewModel.todoTaskList()) { item in
                        HStack {
                            Text("\(item.content)")

                            Spacer()

                            Button {
                                viewModel.onTapDoneButton(id: item.id)
                            } label: {
                                Text("完了")
                                    .foregroundColor(.blue)
                            }

                        }
                    }
                }

                List {
                    ForEach(viewModel.doneTaskList()) { item in
                        HStack {
                            Text("\(item.content)")

                            Spacer()

                            Button {
                                viewModel.onTapTodoButton(id: item.id)
                            } label: {
                                Text("未完了")
                                    .foregroundColor(.blue)
                            }

                        }
                    }
                }

            }
            .navigationTitle("TODOアプリ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    struct CheckBoxToggleStyle:ToggleStyle{
        func makeBody(configuration: Configuration) -> some View {
            Button{
                configuration.isOn.toggle()
            } label: {
                HStack{
                    configuration.label
                    Spacer()
                    Image(systemName: configuration.isOn
                          ? "checkmark.circle.fill"
                          : "circle")
                }
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
