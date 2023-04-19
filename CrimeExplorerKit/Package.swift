// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CrimeExplorerKit",

    defaultLocalization: "en",

    platforms: [
        .macOS(.v12),
        .iOS(.v16),
        .watchOS(.v9)
    ],

    products: [
        .library(name: "CrimeExplorerKit", targets: ["CrimeExplorerKit"])
    ],

    dependencies: [
        .package(url: "https://github.com/adamayoung/police-api", from: "2.0.0")
    ],

    targets: [
        .target(
            name: "CrimeExplorerKit",
            dependencies: [
                .product(name: "PoliceAPI", package: "police-api")
            ]
        ),
        .testTarget(
            name: "CrimeExplorerKitTests",
            dependencies: ["CrimeExplorerKit"]
        )
    ]
)
