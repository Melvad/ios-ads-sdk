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
        .binaryTarget(name: "MelvadAdsCore",
            url: "https://github.com/Melvad/ios-ads-sdk/releases/download/1.0.0/MelvadAdsCore.xcframework.zip",
            checksum: "0cb9df1deae68694430149151b7db032415047b5422242781877042d60a3efc0"),
        .binaryTarget(name: "MelvadAdsRuntime",
            url: "https://github.com/Melvad/ios-ads-sdk/releases/download/1.0.0/MelvadAdsRuntime.xcframework.zip",
            checksum: "2ba4098c1f010197f6714cde5e386a3151fa00f024a6e76e8d2ef8370fa87b1a"),
        .binaryTarget(name: "PrebidMobile",
            url: "https://github.com/Melvad/ios-ads-sdk/releases/download/1.0.0/PrebidMobile.xcframework.zip",
            checksum: "21c8206d8438e2b672358b5d55cb95d75516b9a08ed85874ef65a0fea5bbec5f"),
        .binaryTarget(name: "PrebidMobileOMSDK",
            url: "https://github.com/Melvad/ios-ads-sdk/releases/download/1.0.0/OMSDK_Prebidorg.xcframework.zip",
            checksum: "252fa4d97e2ac57355333ca00e19778df55f8a0fd6ae77b6403780cb77fd0dd9")
    ]
)
