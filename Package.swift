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
        targets: [
            .target(
                    name: "UIExtensions",
                    dependencies: []
            ),
        ]
)
