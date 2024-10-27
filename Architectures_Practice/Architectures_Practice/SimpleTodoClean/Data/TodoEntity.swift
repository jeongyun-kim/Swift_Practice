//
//  TodoEntity.swift
//  Architectures_Practice
//
//  Created by 김정윤 on 10/27/24.
//

import Foundation
import RealmSwift

// 데이터 모델
// - TodoModel과 TodoEntity를 나누는 이유
// - Todo는 도메인 모델로, 비즈니스 로직과 규칙을 표현. 앱의 상태를 나타내는 속성과 그 상태를 변경하는 메서드 포함
// - TodoEntity는 데이터베이스 저장 및 조회를 위한 데이터 모델 
class TodoEntity: Object {
    @Persisted(primaryKey: true) var id: String // 고유 식별자
    @Persisted var title: String = ""             // 할 일 제목
    @Persisted var isCompleted: Bool = false       // 완료 여부
}
