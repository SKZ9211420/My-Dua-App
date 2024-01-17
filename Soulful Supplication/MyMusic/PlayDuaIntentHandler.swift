import AVFoundation
import UIKit
import Intents

class PlayDuaIntentHandler: NSObject, PlayDuaIntentHandling {
    
    override init() {
        super.init()
        donateSiriPhrases()
    }

    private func donateSiriPhrases() {
        DuaManager.shared.duamp3.forEach { dua in
            let intent = PlayDuaIntent(duaInfo: dua.trackName)
            let interaction = INInteraction(intent: intent, response: nil)

            interaction.donate { error in
                if let error = error {
                    print("Failed to donate Siri interaction: \(error.localizedDescription)")
                } else {
                    print("Siri interaction donated successfully for phrase: \(dua.name)")
                }
            }
        }
    }

    func handle(intent: PlayDuaIntent, completion: @escaping (PlayDuaIntentResponse) -> Void) {
        if let duaInfo = intent.duaInfo {
            print("Handling intent for Dua: \(duaInfo)")

            DuaManager.shared.playDuaAudio(withTitle: duaInfo)

            let response = PlayDuaIntentResponse()
            response.responseCode = .success
            completion(response)
        } else {
            let response = PlayDuaIntentResponse()
            response.responseCode = .customFailure
            completion(response)
        }
    }
}
