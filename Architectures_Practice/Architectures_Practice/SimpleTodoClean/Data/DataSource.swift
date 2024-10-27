//
//  DataSource.swift
//  Architectures_Practice
//
//  Created by 김정윤 on 10/27/24.
//

import Foundation
import RealmSwift

// CoreData에서 일어날 수 있는 일들 protocol로 정의
protocol TodoDataSource {
    func getTodos() -> [TodoModel] // 할 일 가져오기
    func save(todo: TodoModel) // 할 일 저장
    // 할 일 삭제 등 ..
}

final class TodoRealmDataSource: TodoDataSource {
    private let realm = try! Realm()
    
    func getTodos() -> [TodoModel] {
        let results =  realm.objects(TodoEntity.self)
        return results.map { TodoModel(title: $0.title, isCompleted: $0.isCompleted) }
    }
    
    func save(todo: TodoModel) {
        let newTodo = TodoEntity()
        newTodo.id = "\(todo.id)"
        newTodo.title = todo.title
        newTodo.isCompleted = todo.isCompleted
        
        do {
            try realm.write {
                realm.add(newTodo)
            }
        } catch {
            print("todo 저장 실패!")
        }
    }
    
    
}
