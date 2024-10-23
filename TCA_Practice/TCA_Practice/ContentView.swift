//
//  ContentView.swift
//  TCA_Practice
//
//  Created by 김정윤 on 10/23/24.
//

import SwiftUI
import ComposableArchitecture

// 도메인 : 만드는 것에 대한 데이터

// View: 사용자가 이벤트를 트리거하는 뷰
// State: UI에 보여지는 데이터 또는 상태
// Action: 이벤트, 노티 등 모든 작업
// Reducer: 로직 수행(State의 변경이 일어남) -> Effect(Side Effect 처리) 반환
// Effect/SideEffect: 앱의 상태를 변경하는 외부의 비동기 작업
// - 네트워크 요청, 데이터베이스 접근, 외부시스템과의 상호작용
// - 비동기 작업 후 결과를 다시 Action으로 반환 => Reducer에 의해 상태 업데이트
// - 성공 시 Effect, 실패 시 Side Effect
// Store: 기능 수행, 모든 상호작용이 Store에 전송되고 Reducer를 통한 상태 변경 후 UI 업데이트
struct ContentView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack {
            Text("count : \(store.count)")
            
            Button("add") {
                store.send(.addCount)
            }
            
            Button("sub") {
                store.send(.subCount)
            }
            
            Button("some") {
                store.send(.someBtnTapped)
            }
            
            Button("merge") {
                store.send(.mergeCount)
            }
        }
        .padding()
    }
}

// 더하기 빼기 기능
@Reducer
struct CounterFeature {
    
    // State: 데이터 / 상태
    // State가 Equatable인 이유
    // - Equatable을 통해 상태의 변화를 체크
    @ObservableState
    struct State: Equatable {
        var count = 0
        var isCounting = false
    }
    
    // Action: 상태 변화를 일으키는 모든 동작
    // - 더하기, 빼기 등
    enum Action {
        case addCount // 더하기
        case subCount // 빼기
        case someBtnTapped
        case someAction(result: String) // 비동기로 통신 결과 받아오기
        case mergeCount
    }
    
    // Reducer: State를 주어진 Action을 바탕으로 처리
    // - View에서 Action을 취하면 Action은 Reducer를 통해 State를 변경
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .addCount:
                print("add")
                state.count += 1
                //state.isCounting.toggle()
                return .none // Effect는ㄴ 반환해야 하는데 아무 동작도 취하지 않을 때 == 비동기 처리가 없을 때
            
            case .subCount:
                print("sub")
                state.count -= 1
                
                if state.isCounting {
                    return .run { send in
                        while true {
                            try await Task.sleep(for: .seconds(1))
                            await send(.addCount)
                        }
                    }
                    // Effect 취소
                    // - id: Effect를 식별하는 값
                    .cancellable(id: "counting")
                } else {
                    // 필요한 타이밍에 cancel 시, 이미 진행중인 Effect 즉시 취소 후 취소된 결과 전달
                    return .cancel(id: "counting")
                }
                
            // someBtnTapped -> 비동기 작업(.run)
            // - Effect 내에서 비동기 작업 후 결과를 앱의 상태변화로 연결
            // - Combine의 Subscriber가 Publisher를 구독하는 것과 유사, RxSwift의 Subscription과 유사
            // - 인자로 비동기 클로저 받아 실행 -> 내부에서 send 통해 Action 재전달 가능
            case .someBtnTapped:
                return .run { [count = state.count] send in
                    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://www.naver.com/\(count)")!)
                    let result = String(decoding: data, as: Unicode.UTF8.self)
                    await send(.someAction(result: result)) // Paramater로 Action을 받음
                    // - 특정 Action 이후 추가적인 동기 액션이 필요한 경우 사용
                    // - 주로 자식 컴포넌트 -> 부모 컴포넌트로 데이터 전달
                }
                
            // 비동기로 받아온 결과 받고나서의 처리
            case .someAction(let result):
                state.count = 0
                print(result)
                return .none
                
            // merge: 여러 Effect를 동시에 실행시킬 수 있음
            // -> concatenate: merge와 같지만 순서 부여
            case .mergeCount:
                // addCount, subCount가 Effect(= Action의 결과 = 비동기 작업)라고 가정
                return .merge(
                    .send(.addCount),
                    .send(.subCount)
                )
            }
        }
    }
    
}
