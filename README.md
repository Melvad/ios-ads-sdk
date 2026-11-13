# Melvad iOS Ads SDK

Binary distribution of the Melvad SDK for iOS 16+. Requires Xcode with Swift 6 support.

Prebuilt XCFrameworks are included in [Frameworks](Frameworks).

## Implementation languages

| Component | Languages |
| --- | --- |
| Native Melvad iOS SDK (Core, Runtime and Tracking) | Swift |
| Web renderers | TypeScript and JavaScript; shipped as JavaScript |

The SDK supports Swift and Objective-C applications. The `*-Swift.h` files are
Objective-C compatibility headers generated from Swift; bundled Prebid and OMID
frameworks also expose native headers. These headers do not describe the language
composition of the SDK implementation.

GitHub language statistics are disabled for this binary repository: compiled Swift
is not counted, while generated headers and runtime assets are. No source-language
percentages are claimed for the binary distribution.

## Installation

In Xcode, select **File → Add Package Dependencies** and enter:

```text
https://github.com/Melvad/ios-ads-sdk
```

Select **Exact Version: 1.0.3** and add both `MelvadAdsCore` and `MelvadAdsRuntime` to your app target.

`MelvadAdsTracking` is optional. Add it only if your app uses ATT-authorized advertising identifiers; configuration is covered in the integration guide.

## Documentation

[Integration guide and examples for all supported ad formats](https://melvad.com/developers?lang=en#ios-sdk).

## License

[Melvad SDK License](LICENSE). Included third-party components retain their [own licenses](Licenses).

