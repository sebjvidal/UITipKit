// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UITipKit",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "UITipKit",
            targets: ["UITipKit"]
        ),
    ],
    targets: [
        .target(
            name: "UITipKit"
        ),
    ]
)
