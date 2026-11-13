import UIKit
import MelvadAdsCore
import MelvadAdsRuntime

@MainActor
final class AdSlotController: NSObject, MelvadAdSessionDelegate {
    let session: MelvadAdSession
    var onReady: ((MelvadAdSession) -> Void)?
    var onUnavailable: (() -> Void)?
    var onError: ((NSError) -> Void)?
    var onEvent: ((String) -> Void)?
    var onEarnedReward: (() -> Void)?
    var onClosed: (() -> Void)?
    private var awaitingLoad = false

    init(configuration: SupplierConfiguration, privacy: PrivacyContext) {
        session = MelvadAdSession(configuration: configuration)
        super.init()
        session.updatePrivacy(privacy)
        session.delegate = self
    }

    func load(in slot: UIView, inventoryID: String,
              placementID: String, mode: String? = nil,
              rewardUserID: String? = nil) {
        slot.isHidden = false
        slot.superview?.layoutIfNeeded()
        guard slot.window != nil,
              slot.bounds.width >= 1, slot.bounds.height >= 1 else {
            onError?(NSError(domain: "MelvadIntegration", code: 1,
                userInfo: [NSLocalizedDescriptionKey:
                    "Attach the ad slot to a window and set its size before loading."]))
            return
        }
        awaitingLoad = true
        if let rewardUserID {
            session.load(in: slot, inventoryID: inventoryID,
                         placementID: placementID, mode: mode,
                         width: Int(slot.bounds.width),
                         height: Int(slot.bounds.height), rewardUserID: rewardUserID)
        } else {
            session.load(in: slot, inventoryID: inventoryID,
                         placementID: placementID, mode: mode,
                         width: Int(slot.bounds.width),
                         height: Int(slot.bounds.height))
        }
    }

    func adSession(_ session: MelvadAdSession,
                   didChange state: MelvadAdSessionState) {
        switch state {
        case .ready where awaitingLoad:
            awaitingLoad = false
            onReady?(session)
        case .noFill, .destroyed:
            awaitingLoad = false
            onUnavailable?()
        case .idle, .failed:
            awaitingLoad = false
        default:
            break
        }
    }

    func adSession(_ session: MelvadAdSession, didFail error: NSError) {
        onError?(error)
    }

    func adSession(_ session: MelvadAdSession, didReceiveEvent event: String) {
        onEvent?(event)
    }

    func adSessionDidEarnReward(_ session: MelvadAdSession) {
        onEarnedReward?()
    }

    func adSessionDidClose(_ session: MelvadAdSession) {
        onClosed?()
    }

    func adSession(_ session: MelvadAdSession, didClick url: URL) {
        UIApplication.shared.open(url)
    }
}
