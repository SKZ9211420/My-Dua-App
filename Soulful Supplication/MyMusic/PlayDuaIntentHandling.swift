import AVFoundation
import UIKit
import Intents

@available(iOS 15.0, *)
protocol PlayDuaIntentHandling: AnyObject {
    func handle(intent: PlayDuaIntent, completion: @escaping (PlayDuaIntentResponse) -> Void)
}

@available(iOS 15.0, *)
extension PlayDuaIntentHandling {
    func handle(intent: PlayDuaIntent, completion: @escaping (PlayDuaIntentResponse) -> Void) {
        if let duaInfo = intent.duaInfo {
            DuaManager.shared.playDuaAudio(withTitle: duaInfo)

            let response = PlayDuaIntentResponse()
            response.responseCode = .success
            completion(response)
            return
        }

        let response = PlayDuaIntentResponse()
        response.responseCode = .customFailure
        completion(response)
    }
}
