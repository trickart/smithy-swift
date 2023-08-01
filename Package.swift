// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "smithy-swift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "ClientRuntime", targets: ["ClientRuntime"]),
        .library(name: "SmithyTestUtil", targets: ["SmithyTestUtil"])
    ],
    dependencies: [
        .package(url: "https://github.com/awslabs/aws-crt-swift.git", .exact("0.12.0")),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        .package(url: "https://github.com/CoreOffice/XMLCoder.git", .exact("0.17.0"))
    ],
    targets: [
        .target(
            name: "ClientRuntime",
            dependencies: [
                .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "XMLCoder", package: "XMLCoder")
            ]
        ),
        .testTarget(
            name: "ClientRuntimeTests",
            dependencies: ["ClientRuntime", "SmithyTestUtil"]
        ),
        .target(
            name: "SmithyTestUtil",
            dependencies: ["ClientRuntime"]
        ),
        .testTarget(
            name: "SmithyTestUtilTests",
            dependencies: ["SmithyTestUtil"]
        )
    ]
)
