// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Snap",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Snap",
                 targets: ["Snap"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Snap",
                dependencies: []),
    ]
)
