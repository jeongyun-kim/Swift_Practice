//
//  TodoView.swift
//  Architectures_Practice
//
//  Created by 김정윤 on 10/27/24.
//

import SwiftUI

struct TodoView: View {
    @StateObject private var vm: TodoViewModel
    
    init(vm: TodoViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.todos, id: \.id) { todo in
                    HStack {
                        Text(todo.title) // 할 일 제목 표시
                        Spacer()
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle") // 완료 상태 아이콘
                    }
                }
            }
            .navigationTitle("Todo List") // 네비게이션 타이틀 설정
            .navigationBarItems(trailing: Button(action: {
                vm.addTodo(title: "New Todo") // 새로운 할 일 추가
            }) {
                Image(systemName: "plus") // 추가 버튼 아이콘
            })
        }
    }
}
