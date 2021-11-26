// swift-tools-version:5.5

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
        ],
        targets: [
            .target(
                    name: "UIExtensions",
                    dependencies: []
            ),
        ]
)
