//
//  TaskListView.swift
//  TODOApp
//
//  Created by cw-ryu.nakayama on 2023/07/30.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel: TaskListViewModel = .init()
    @State var toggle: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.taskList.items) { item in
                        HStack {
                            Text("\(item.content)")
                            Toggle("Toggle", isOn: $toggle)
                              .toggleStyle(CheckBoxToggleStyle())
                        }
                    }
                }
            }
            .navigationTitle("TODOアプリ")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {

                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
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
