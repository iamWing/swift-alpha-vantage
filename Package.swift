// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlphaVantageExecutable",
    products: [
        .executable(name: "AlphaVantageExecutable",
                    targets: ["AlphaVantageExecutable"]),
        .library(name: "AlphaVantage", targets: ["AlphaVantage"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/IBM-Swift/Configuration.git",
            from: "3.0.4"
        ),
        .package(url: "https://github.com/IBM-Swift/SwiftyRequest",
                 from: "3.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "AlphaVantageExecutable",
            dependencies: ["AlphaVantage", "Configuration"]
        ),
        .target(
            name: "AlphaVantage",
            dependencies: ["SwiftyRequest"]
        ),
        .testTarget(
            name: "AlphaVantageTests",
            dependencies: ["AlphaVantage"]
        ),
    ]
)