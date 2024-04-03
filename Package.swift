// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "3.0.0-rc.1"

let binaries = [
    "MapboxCommon": "a8874af6acfafac0f5cf2c9a051967e4381bb7ed3707a44b9c6e6bef9d488456",
    "MapboxCoreMaps": "e03cbb9f9c60dcaaa6f58b83d57d7796e95d5cd9ae4e47cc194b7c917c930e31",
    "MapboxDirections": "974559a90d6aba462bb0527001456dc16ffd3ae506791cfd3d61fc986fe02d0e",
    "MapboxMaps": "97485654d30264683df34e9cf0be5e4d09262759b3b1550ea21910172413e8fe",
    "MapboxNavigationNative": "743b54c3cbb92f77458cf3c29278b863e0b30b745f737606a29fc980a839fb20",
    "Turf": "2f5fffc7075f8582aca328f13b49e14cfb13d3ed1ee0789e53d657d827860b6f",
    "MapboxNavigationCore": "17f52c9aa1d941638489a3f2d55e8184ce17012c8eee0156e86cdcfbdb4bf189",
    "_MapboxNavigationUXPrivate": "1ee894eee848474826d5ab21761067d966e7343e0f436b985d21489fe6b2c3e2",
]

let package = Package(
    name: "MapboxNavigation",
    products: [
        .library(
            name: "MapboxNavigationCore",
            targets: ["MapboxNavigationCoreWrapper"]
        ),
    ],
    targets: [
        .target(
            name: "MapboxNavigationCoreWrapper",
            dependencies: binaries.keys.map { .byName(name: $0) }
        )
    ] + binaryTargets()
)

func binaryTargets() -> [Target] {
    return binaries.map { binaryName, checksum in
        Target.binaryTarget(
            name: binaryName,
            url: "https://api.mapbox.com/downloads/v2/navsdk-v3-ios" +
                "/releases/ios/packages/\(version)/\(binaryName).xcframework.zip",
            checksum: checksum
        )
    }
}
