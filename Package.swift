// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkLayer",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "APIClient",
            targets: ["APIClient"]
        ),
        .library(
            name: "Extensions",
            targets: ["Extensions"]
        ),
        .library(name: "Helpers", targets: ["Helpers"])
    ],
    targets: [
        .target(
            name: "APIClient",
            dependencies: [
                "Extensions",
                "Helpers"
            ]
        ),
        .target(
            name: "Extensions",
            dependencies: ["Helpers"]
        ),
        .target(name: "Helpers")
    ]
)
