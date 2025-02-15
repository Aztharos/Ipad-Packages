// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MonPackageSwift",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/httpswift/swifter.git", from: "1.0.0"),
        .package(url: "https://github.com/JohnSundell/Ink.git", from: "2.0.0"),
        .package(url: "https://github.com/raspu/Highlightr.git", from: "2.0.0"),
        .package(url: "https://github.com/Aztharos/SwiftSoup.git", from: "2.0.0")
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
