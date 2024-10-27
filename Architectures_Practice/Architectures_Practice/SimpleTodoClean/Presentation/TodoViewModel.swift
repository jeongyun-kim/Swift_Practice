//
//  TodoViewModel.swift
//  Architectures_Practice
//
//  Created by 김정윤 on 10/27/24.
//

import SwiftUI

final class TodoViewModel: ObservableObject {
    private let useCase: TodoUseCase // 리스트 불러오기, 할 일 저장 
    @Published var todos: [TodoModel] = []
    
    init(useCase: TodoUseCase) {
        self.useCase = useCase
        fetchTodos()
    }
    
    private func fetchTodos() {
        todos = useCase.fetchTodos()
    }
    
    func addTodo(title: String) {
        useCase.addTodo(title: title)
        fetchTodos()
    }
    
    func removeTodo(_ todo: TodoModel) {
        useCase.remove(todo: todo)
        fetchTodos()
    }
    
    func completeTodo(_ todo: TodoModel) {
        useCase.complete(todo: todo)
        fetchTodos()
    }
}
