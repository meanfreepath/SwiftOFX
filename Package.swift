// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftOFX",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftOFX",
            targets: ["SwiftOFX"]),
    ],
    dependencies: [
        .package(url: "https://github.com/libsteve/Reggie", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftOFX",
            dependencies: [
                .product(name: "Reggie", package: "Reggie")
            ],
            path: "Source",
            exclude: ["Info.plist", "SwiftOFX.h"]
        ),
        .testTarget(
            name: "SwiftOFXTests",
            dependencies: ["SwiftOFX"],
            path: "Tests",
            exclude: ["Info.plist"],
            resources: [
                .copy("Resources/example.ofx")
            ]
        ),
    ]
)
