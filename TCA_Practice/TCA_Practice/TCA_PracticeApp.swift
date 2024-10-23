//
//  TCA_PracticeApp.swift
//  TCA_Practice
//
//  Created by 김정윤 on 10/23/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: CounterFeature.State(), reducer: {
                CounterFeature()
            }))
        }
    }
}
