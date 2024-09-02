// swift-tools-version:5.10

import PackageDescription

let package = Package(
        name: "UIExtensions",
        platforms: [
            .iOS(.v14),
        ],
        products: [
            .library(
                    name: "UIExtensions",
                    targets: ["UIExtensions"]
            ),
        ],
        dependencies: [
            .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.7.1"),
            .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.54.3"),
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
