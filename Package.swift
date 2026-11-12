// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MelvadAdsSDK",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "MelvadAdsCore", targets: ["MelvadAdsCore"]),
        .library(name: "MelvadAdsRuntime", targets: [
            "MelvadAdsRuntime", "MelvadAdsCore", "PrebidMobile", "PrebidMobileOMSDK", "OMSDK_Melvad"
        ]),
        .library(name: "MelvadAdsTracking", targets: ["MelvadAdsTracking", "MelvadAdsCore"])
    ],
    targets: [
        .binaryTarget(name: "MelvadAdsCore", path: "Frameworks/MelvadAdsCore.xcframework"),
        .binaryTarget(name: "MelvadAdsRuntime", path: "Frameworks/MelvadAdsRuntime.xcframework"),
        .binaryTarget(name: "PrebidMobile", path: "Frameworks/PrebidMobile.xcframework"),
        .binaryTarget(name: "PrebidMobileOMSDK", path: "Frameworks/OMSDK_Prebidorg.xcframework"),
        .binaryTarget(name: "OMSDK_Melvad", path: "Frameworks/OMSDK_Melvad.xcframework"),
        .binaryTarget(name: "MelvadAdsTracking", path: "Frameworks/MelvadAdsTracking.xcframework")
    ]
)
