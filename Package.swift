// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iTransmissionFramework",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iTransmissionFramework",
            targets: ["iTransmissionFramework"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "iTransmissionFramework",
            url: "https://github.com/alexsvitlov/iTransmissionFramework/releases/download/1.0.0/iTransmissionFramework.xcframework.zip",
            checksum: "c8361f48c43599b4bbbbae18b4a8842aa34908bb30bc708eeed1524602f472ae"
        )
    ]
)
