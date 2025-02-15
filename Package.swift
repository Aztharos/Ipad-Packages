// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MonPackageSwift",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/Aztharos/swifter.git", .exact("V1.5.0")),
        .package(url: "https://github.com/Aztharos/Ink.git", .exact("0.6.0")),
        .package(url: "https://github.com/raspu/Highlightr.git", from: "2.0.0"),
        .package(url: "https://github.com/Aztharos/SwiftSoup.git", .exact("2.7.7"))
    ],
    targets: [
        .target(
            name: "MonPackageSwift",
            dependencies: [
                "Swifter",
                "Ink",
                "Highlightr",
                "SwiftSoup"
            ]
        ),
        .testTarget(
            name: "MonPackageSwiftTests",
            dependencies: ["MonPackageSwift"]
        )
    ]
)
