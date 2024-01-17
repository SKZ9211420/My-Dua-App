//
//  AppDelegate.swift
//

//import UIKit

//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {



  //  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    //    return true
    //}

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
  //      return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    //}

    //func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    //}
    
//}


//
//  AppDelegate.swift
//

// DuaApp/AppDelegate.swift

import AVFoundation
import UIKit
import Intents

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var duaManager = DuaManager.shared // Use the singleton instance of DuaManager
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Step 1: Request Siri Authorization
        INPreferences.requestSiriAuthorization { status in
            if status == .authorized {
                // Step 2: Donate Siri Interactions
                self.donateSiriInteractions()
            } else {
                print("Siri authorization denied.")
            }
        }

        return true
    }

    private func donateSiriInteractions() {
        let duaManager = DuaManager.shared

        for dua in duaManager.duamp3 {
            let playDuaIntent = PlayDuaIntent(duaInfo: dua.trackName)
            donateSiriInteraction(intent: playDuaIntent)
        }
    }

    private func donateSiriInteraction(intent: PlayDuaIntent?) {
        guard let intent = intent else {
            print("PlayDuaIntent is nil.")
            return
        }

        INInteraction(intent: intent, response: nil).donate { error in
            if let error = error {
                print("Failed to donate intent: \(error.localizedDescription)")
            } else {
                print("Intent donated successfully for title: \(intent.duaInfo ?? "")")
            }
        }
    }

    // Other AppDelegate methods...
}
