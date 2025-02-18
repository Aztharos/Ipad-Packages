// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Ipad-Packages",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Ipad-Packages",
            targets: ["Highlightr", "Ink", "SwiftSoup", "Swifter"]
        )
    ],
    targets: [
        .target(
            name: "Highlightr",
            dependencies: [],
            path: "Sources/Highlightr",
            exclude: [
                "Assets/Highlighter/LICENSE",
            ],
            sources: [
                "Classes",
            ],
            resources: [
                .copy("Assets/Highlighter/highlight.min.js"),
                .copy("Assets/styles/github-dark.min.css")
            ]
        ),
        .target(
            name: "Ink",
            path: "Sources/Ink"
        ),
        .target(
            name: "SwiftSoup",
            path: "Sources/SwiftSoup"
        ),
        .target(
      name: "Swifter",
      path: "Sources/Swifter"
        )
    ]
)
