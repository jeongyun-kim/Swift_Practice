import ProjectDescription

let project = Project(
    name: "tuistDir", // 프로젝트 명
    packages: [ // SPM의 Packages
        .remote(
            url: "https://github.com/Alamofire/Alamofire.git",
            requirement: .upToNextMajor(from: "5.10.0")
        )
    ],
    targets: [ // 프로젝트의 타겟
        .target(
            name: "tuistDir",
            destinations: [.iPhone], // 지원 기기 설정
            product: .app,
            bundleId: "io.tuist.tuistDir",
            deploymentTargets: .iOS("16.0"), // 지원 최소 버전 설정
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                    // 세로모드 고정 
                    "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"]
                    //"MinimumOSVersion": "16.0" // Minimum Deployment 버전 설정
                ]
            ),
            sources: ["tuistDir/Sources/**"],
            resources: ["tuistDir/Resources/**"],
            dependencies: [
                .package(product: "Alamofire")
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
    // 커스텀 파일 헤더
    fileHeaderTemplate: "Copyright © 2024 jeongyun. All rights reserved."
)
