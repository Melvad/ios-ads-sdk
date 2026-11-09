// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MelvadAdsSDK",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "MelvadAdsCore", targets: ["MelvadAdsCore"]),
        .library(name: "MelvadAdsRuntime", targets: [
            "MelvadAdsRuntime", "MelvadAdsCore", "PrebidMobile", "PrebidMobileOMSDK"
        ])
    ],
    targets: [
        .binaryTarget(name: "MelvadAdsCore", path: "Frameworks/MelvadAdsCore.xcframework"),
        .binaryTarget(name: "MelvadAdsRuntime", path: "Frameworks/MelvadAdsRuntime.xcframework"),
        .binaryTarget(name: "PrebidMobile", path: "Frameworks/PrebidMobile.xcframework"),
        .binaryTarget(name: "PrebidMobileOMSDK", path: "Frameworks/OMSDK_Prebidorg.xcframework")
    ]
)
