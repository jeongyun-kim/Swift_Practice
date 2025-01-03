import ProjectDescription

let project = Project(
    name: "tuistDir", // 프로젝트 명
    packages: [ // SPM의 Packages
    ],
    targets: [ // 프로젝트의 타겟
        .target(
            name: "tuistDir",
            destinations: [.iPhone], // 지원 기기 설정
            product: .app,
            bundleId: "com.jeongyun.tuistDir",
            deploymentTargets: .iOS("16.0"), // 지원 최소 버전 설정
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                    "NSAppTransportSecurity":["NSAllowsArbitraryLoads":true],
                    // 세로모드 고정
                    "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"]
                    //"MinimumOSVersion": "16.0" // Minimum Deployment 버전 설정
                ]
            ),
            sources: ["tuistDir/Sources/**"],
            resources: ["tuistDir/Resources/**"],
            dependencies: [
                .project(target: "Feature", path: "Feature")
            ]
        ),
        .target(
            name: "tuistDirTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.tuistDirTests",
            infoPlist: .default,
            sources: ["tuistDir/Tests/**"],
            resources: [],
            dependencies: [.target(name: "tuistDir")]
        ),
    ],
    fileHeaderTemplate: nil
//    // 커스텀 파일 헤더
//    fileHeaderTemplate: "Copyright © 2024 jeongyun. All rights reserved."
)
