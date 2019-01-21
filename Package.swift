// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "TimeLapse",
    products: [
        .library(
            name: "TimeLapse",
            targets: ["TimeLapse"])
    ],
    targets: [
        .target(
            name: "TimeLapse"),
        .testTarget(
            name: "TimeLapseTests",
            dependencies: ["TimeLapse"])
    ]
)
