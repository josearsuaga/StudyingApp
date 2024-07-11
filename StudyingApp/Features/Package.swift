// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [
        .iOS(
            .v16
        )
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Features",
            targets: [
                "Home",
                "Battle",
                "Selection",
                "PokemonDetail",
                "Tasks"
            ]
        ),
    ],
    dependencies: [
        .package(path: "../Shared"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Home",
            dependencies: [
                "Shared",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .target(
            name: "PokemonDetail",
            dependencies: [
                "Shared",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .target(
            name: "Battle",
            dependencies: [
                "Shared",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .target(
            name: "Selection",
            dependencies: [
                "Shared",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .target(
            name: "Tasks"
        ),
        .testTarget(
            name: "HomeTests",
            dependencies: [
                "Home",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
    ]
)
