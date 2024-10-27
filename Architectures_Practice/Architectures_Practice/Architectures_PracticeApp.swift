//
//  Architectures_PracticeApp.swift
//  Architectures_Practice
//
//  Created by 김정윤 on 10/24/24.
//

import SwiftUI
import CoreData

@main
struct Architectures_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            let dataSource = TodoRealmDataSource()
            let useCase = TodoUseCaseImpl(dataSource: dataSource)
            let vm = TodoViewModel(useCase: useCase)
            TodoView(vm: vm)
            //MVPViewControllerWrapper()
        }
    }
}
