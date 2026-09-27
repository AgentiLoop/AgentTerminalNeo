// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "AgentTerminalNeo",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "AgentTerminalNeo",
            targets: ["AgentTerminalNeo"]
        ),
    ],
    targets: [
        .target(
            name: "AgentTerminalNeo",
            path: "Sources/AgentTerminalNeo"
        ),
    ]
)
