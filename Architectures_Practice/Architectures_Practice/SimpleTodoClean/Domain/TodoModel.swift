//
//  TodoModel.swift
//  Architectures_Practice
//
//  Created by 김정윤 on 10/27/24.
//

import Foundation

// 데이터 모델: 일반적으로 데이터베이스와 상호작용
// 도메인 모델: 비즈니스 로직을 포함

// TodoModel의 경우, 할 일에 대한 정보를 포함하고 isCompleted 등을 기반으로 비즈니스 로직 처리가 가능함
// -> 데이터 모델 
struct TodoModel {
    let id: UUID
    let title: String
    let isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.id = UUID()
        self.title = title
        self.isCompleted = isCompleted
    }
}
