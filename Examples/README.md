# Swift integration example

Add [AdSlotController.swift](AdSlotController.swift) to an iOS 16+ app that links
`MelvadAdsCore` and `MelvadAdsRuntime` 1.0.3. This is the app-level session owner
from the [integration guide](https://melvad.com/developers?lang=en#ios-sdk).

Retain one controller per placement as a property of your view controller; the
SDK holds its delegate weakly. Create it with a `SupplierConfiguration` for your
account and the actual `PrivacyContext` from your CMP. The guide covers obtaining
the app identity, user agent and display/video route.

After consent permits an ad request, call `load` with a slot already attached to
a window and sized by your layout. Set `onReady` to show a banner with
`session.show()` or present a fullscreen placement with `session.present(from:)`.
The helper invokes `onReady` after a load, so hiding an existing ad does not
immediately show it again. All calls and callbacks run on the main actor.

Use `onEarnedReward` for local rewarded completion; it is not confirmation of a
server-side balance. Use `session.hide()` and `session.show()` when visibility
changes, and call `session.destroy()` when permanently removing the placement.

This source is an integration helper. The SDK implementation remains in the
published XCFrameworks.
