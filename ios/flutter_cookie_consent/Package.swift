// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flutter_cookie_consent",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "flutter-cookie-consent", targets: ["flutter_cookie_consent"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "flutter_cookie_consent",
            dependencies: [],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
