# Melvad iOS Ads SDK

Binary distribution of the Melvad SDK for iOS 16+. Requires Xcode with Swift 6 support.

Prebuilt XCFrameworks are included in [Frameworks](Frameworks).

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

