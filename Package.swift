// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AtcoderWorkspace",
    
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-algorithms",
            from: "1.0.0"
        ),
        .package(
            url: "https://github.com/apple/swift-collections.git", 
            from: "1.0.0"
        )
    ],

    targets: [
       .target(
            name: "AtcoderWorkspace",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections")
            ],
            path: "AtcoderWorkspace"
        ),
    ]
)
