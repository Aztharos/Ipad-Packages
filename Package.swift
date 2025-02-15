// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MonPackageSwift",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
        products: [
        .library(
            name: "MonPackageSwift", 
            targets: ["MonPackageSwift"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Aztharos/swifter.git", .exact("1.5.0")),
        .package(url: "https://github.com/Aztharos/Ink.git", .exact("0.6.0")),
        .package(url: "https://github.com/Aztharos/Highlightr.git", .exact("2.2.1")),
        .package(url: "https://github.com/Aztharos/SwiftSoup.git", .exact("2.7.7"))
    ],
    targets: [
        .target(
            name: "MonPackageSwift",
            dependencies: [
                .product(name: "Swifter", package: "swifter"),
                .product(name: "Ink", package: "Ink"),
                .product(name: "Highlightr", package: "Highlightr"),
                .product(name: "SwiftSoup", package: "SwiftSoup")
            ]
        )
    ]
)
