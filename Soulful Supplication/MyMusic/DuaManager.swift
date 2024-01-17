import Foundation
import AVFoundation
import UIKit

struct dmp3: Codable {
    let name: String
    let imageName: String
    let trackName: String
}

class DuaManager {
    static let shared = DuaManager() // Singleton instance

    var duamp3: [dmp3] = []

    private init() {
        // Initialize duamp3 or load it from a data source
        configureSongs()
    }

    private func configureSongs() {
        duamp3.append(dmp3(name: "Dua After Exiting Washroom",
                          imageName: "Dua After Exiting Washroom",
                          trackName: "Dua after Toilet"))
        duamp3.append(dmp3(name: "Dua After Waking Up",
                          imageName: "Dua After Waking Up",
                          trackName: "Dua after waking_up"))
        duamp3.append(dmp3(name: "Dua Before Entering Washroom",
                          imageName: "Dua Before Entering Washroom",
                          trackName: "Dua before toilet"))
        duamp3.append(dmp3(name: "Dua Before Sleeping",
                          imageName: "Dua Before Sleeping",
                          trackName: "Dua before sleeping"))
        duamp3.append(dmp3(name: "Dua Before Wudhu",
                          imageName: "Dua Before Wudhu",
                          trackName: "Dua before Wadu"))
    }

    func playDuaAudio(withTitle title: String) {
        guard let path = Bundle.main.path(forResource: title, ofType: "mp3") else {
            print("Audio file not found.")
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)

            let player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("Error setting up audio session or playing audio: \(error.localizedDescription)")
        }
    }
}
