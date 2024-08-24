// swift-tools-version:5.10

import PackageDescription

let package = Package(
        name: "UIExtensions",
        platforms: [
            .iOS(.v13),
        ],
        products: [
            .library(
                    name: "UIExtensions",
                    targets: ["UIExtensions"]
            ),
        ],
        dependencies: [
            .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1"))
        ],
        targets: [
            .target(
                    name: "UIExtensions",
                    dependencies: [
                        "SnapKit"
                    ]
            ),
        ]
)
