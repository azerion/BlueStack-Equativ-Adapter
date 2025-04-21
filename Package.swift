// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BlueStackEquativAdapter",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "BlueStackEquativAdapter",
            targets: ["BlueStackEquativAdapterTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/azerion/BlueStackSDK.git", from: "5.1.4"),
        .package(url: "https://github.com/smartadserver/swift-package-manager-display-sdk.git", .upToNextMajor(from: "8.0.0"))
    ],
    targets: [
        .target(
            name: "BlueStackEquativAdapterTarget",
            dependencies: [
                .product(name: "SASDisplayKit", package: "swift-package-manager-display-sdk"),
                .target(name: "BlueStackEquativAdapter", condition: .when(platforms: [.iOS])),
                .product(name: "BlueStackSDK", package: "BlueStackSDK", condition: .when(platforms: [.iOS]))
            ],
            path: "BlueStackEquativAdapterWrapper"
        ),
        .binaryTarget(
            name: "BlueStackEquativAdapter",
            path: "BlueStackEquativAdapter.xcframework"
        )
    ]
)