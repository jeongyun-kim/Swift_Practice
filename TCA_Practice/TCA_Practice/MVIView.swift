//
//  MVIView.swift
//  TCA_Practice
//
//  Created by 김정윤 on 10/24/24.
//

import SwiftUI

// MVI
// - Model - View - Intent
// - Intent를 통해 사용자의 이벤트를 받아 Model의 상태 변경 -> View Update
// Model : 데이터
// View : 사용자 인터페이스, 상호작용을 Intent로 변환
// Intent : 사용자의 액션이나 시스템 이벤트를 처리하는 로직

// TCA의 State?
struct CounterState {
    var count = 0
}

// TCA의 Action?
// - 모든 상태 변경은 intent를 통해 이뤄지고 상태 객체를 통해 일관되게 관리
// - Intent를 통해 상태 변경을 처리해 부수 효과가 예측 가능, 비동기 작업도 Intent 내에서 처리

enum CounterIntent {
    case addCount
    case subCount
}

// TCA의 Reducer?
class CounterViewModel: ObservableObject {
    @Published private(set) var state = CounterState()
    
    func send(_ intent: CounterIntent) {
        switch intent {
        case .addCount:
            state.count += 1
        case .subCount:
            state.count -= 1
        }
    }
}

struct MVIView: View {
    @ObservedObject var vm = CounterViewModel()
    
    var body: some View {
        VStack {
            Text("count : \(vm.state.count)")
            
            Button("add") {
                vm.send(.addCount)
            }
            
            Button("sub") {
                vm.send(.subCount)
            }
        }
        .padding()
    }
}
