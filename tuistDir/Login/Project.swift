//
//  Project.swift
//  Config
//
//  Created by 김정윤 on 10/28/24.
//

import Foundation
import ProjectDescription

let project = Project(
    name: "LoginFeature", // 프로젝트 명
    targets: [ // 프로젝트의 타겟
        .target(
            name: "LoginFeature",
            destinations: [.iPhone], // 지원 기기 설정
            product: .framework,
            bundleId: "com.jeongyun.login.feature",
            deploymentTargets: .iOS("16.0"), // 지원 최소 버전 설정,
            infoPlist: .extendingDefault(with: ["NSAppTransportSecurity":["NSAllowsArbitraryLoads":true]]),
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "NetworkKit", path: "../Network"),
                .project(target: "Common", path: "../Common")
            ]
        )
    ],
    fileHeaderTemplate: "Copyright © 2024 jeongyun. All rights reserved."
)
