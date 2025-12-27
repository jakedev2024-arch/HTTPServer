// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HTTPServer",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "HTTPServer",
            targets: ["HTTPServer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/robbiehanson/CocoaAsyncSocket.git", from: "7.6.5"),
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0")
    ],
    targets: [
        .target(
            name: "HTTPServer",
            dependencies: [
                .product(name: "CocoaAsyncSocket", package: "CocoaAsyncSocket"),
                .product(name: "CocoaLumberjack", package: "CocoaLumberjack")
            ],
            path: "Sources",
            publicHeadersPath: "HTTPServer",
            cSettings: [
                .headerSearchPath("HTTPServer")
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit")
            ]
        ),
    ]
)

