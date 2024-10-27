//
//  TodoUseCase.swift
//  Architectures_Practice
//
//  Created by 김정윤 on 10/27/24.
//

import Foundation

// UseCase: 사용자가 하고자 하는 것
protocol TodoUseCase {
    func fetchTodos() -> [TodoModel]
    func addTodo(title: String)
}

final class TodoUseCaseImpl: TodoUseCase {
    private let dataSource: TodoRealmDataSource
    
    init(dataSource: TodoRealmDataSource) {
        self.dataSource = dataSource
    }
    
    private var todos: [TodoModel] = []
    
    // 할 일 목록 가져오기
    func fetchTodos() -> [TodoModel] {
        //return todos
        return dataSource.getTodos()
    }
    
    // 할 일 추가
    func addTodo(title: String) {
        let todo = TodoModel(title: title, isCompleted: false)
        dataSource.save(todo: todo)
       // todos.append(todo)
    }
}
