// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenLibraryKit",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .tvOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "OpenLibraryKit",
            targets: ["OpenLibraryKit"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "OpenLibraryKit",
            dependencies: []),
        .testTarget(
            name: "OpenLibraryKitTests",
            dependencies: ["OpenLibraryKit"])
    ]
)
