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
            // 1. On expose ZIPFoundation dans le produit final
            targets: ["Highlightr", "Ink", "SwiftSoup", "Swifter", "ZIPFoundation"]
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
        ),
        // 2. On déclare le nouveau dossier source comme une target
        .target(
            name: "ZIPFoundation",
            path: "Sources/ZIPFoundation"
        )
    ]
)
