//
//  ViewController.swift
//  MyMusic
//
//

//import UIKit
//import IntentsUI

//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //@IBOutlet var table: UITableView!

    //var duamp3 = [dmp3]()

    //override func viewDidLoad() {
        //super.viewDidLoad()
        //configureSongs()
       // table.delegate = self
      //  table.dataSource = self
    //}

    //func configureSongs() {
        //duamp3.append(dmp3(name: "Dua After Exiting Washroom",
            //              imageName: "Dua After Exiting Washroom",
          //                trackName: "Dua after Toilet"))
        //duamp3.append(dmp3(name: "Dua After Waking Up",
            //              imageName: "Dua After Waking Up",
          //                trackName: "Dua after waking up"))
        //duamp3.append(dmp3(name: "Dua Before Entering Washroom",
            //              imageName: "Dua Before Entering Washroom",
          //                trackName: "Dua before going to Toilet"))
        //duamp3.append(dmp3(name: "Dua Before Sleeping",
            //              imageName: "Dua Before Sleeping",
          //                trackName: "Dua before sleeping"))
        //duamp3.append(dmp3(name: "Dua Before Wudhu",
       //                   imageName: "Dua Before Wudhu",
      //                    trackName: "Dua before starting Wadu"))



    //}

    // Table

    //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return duamp3.count
    //}

    //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       // let song = duamp3[indexPath.row]
        
        // configure
        
        //cell.textLabel?.text = song.name
        //cell.accessoryType = .disclosureIndicator
        //cell.imageView?.image = UIImage(named: song.imageName)
        //cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 12)
        //cell.detailTextLabel?.font = UIFont(name: "Helvetica-Bold", size: 12)

      //  return cell
    //}

    //func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      //  return 100
    //}

    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)

        // present the player
        
        //let position = indexPath.row
        //guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
         //   return
        //}
        //vc.duamp3 = duamp3
      //  vc.position = position
    //    present(vc, animated: true)
  //  }


//}

//struct dmp3 {
    //let name: String
    //let imageName: String
  //  let trackName: String
//}

// ABOVE IS ORIGINAL CODE BELOW IS INTEGRATED CODE


//import UIKit
//import IntentsUI
//import AVFoundation


//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  //  @IBOutlet var table: UITableView!
    
    //var duamp3 = [dmp3]()
   // var player: AVAudioPlayer?

    //override func viewDidLoad() {
      //  super.viewDidLoad()
        //configureSongs()
        //table.delegate = self
        //table.dataSource = self

        // Step 1: Request Siri Authorization
        //INPreferences.requestSiriAuthorization { status in
            //if status == .authorized {
                // Step 2: Donate Siri Interactions
               // self.donateSiriInteractions()
           // } else {
           //     print("Siri authorization denied.")
          //  }
       // }
  //  }

  //  func configureSongs() {
     //   duamp3.append(dmp3(name: "Dua After Exiting Washroom",
      //                    imageName: "Dua After Exiting Washroom",
      //                    trackName: "Dua after Toilet"))
   //     duamp3.append(dmp3(name: "Dua After Waking Up",
      //                    imageName: "Dua After Waking Up",
      //                    trackName: "Dua After Waking Up"))
     //   duamp3.append(dmp3(name: "Dua Before Entering Washroom",
     //                     imageName: "Dua Before Entering Washroom",
     //                     trackName: "Dua Before Toilet"))
     //   duamp3.append(dmp3(name: "Dua Before Sleeping",
     //                     imageName: "Dua Before Sleeping",
     //                     trackName: "DuaBeforeSleeping"))
      //  duamp3.append(dmp3(name: "Dua Before Wudhu",
      //                    imageName: "Dua Before Wudhu",
      //                    trackName: "DuaBeforeWadu"))
    //}

   // func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   //     return duamp3.count
   // }

   // func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   //     let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    //    let song = duamp3[indexPath.row]

   //     cell.textLabel?.text = song.name
   //     cell.accessoryType = .disclosureIndicator
   //     cell.imageView?.image = UIImage(named: song.imageName)
   //     cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 12)
   //     cell.detailTextLabel?.font = UIFont(name: "Helvetica-Bold", size: 12)

   //     return cell
   // }

   // func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
   //     return 100
   // }

   // func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   //     tableView.deselectRow(at: indexPath, animated: true)
   //     playAudio(at: indexPath.row)
   // }

  //  private func donateSiriInteractions() {
  //      for dua in duamp3 {
  //          donateSiriInteraction(withTitle: dua.name)
  //      }
  //  }

   // private func donateSiriInteraction(withTitle title: String) {
    //    let playDuaIntent = PlayDuaIntent()
    //    playDuaIntent.duaTitle = title

    //    let shortcut = INShortcut(intent: playDuaIntent)
    //    let interaction = INInteraction(intent: playDuaIntent, response: nil)

    //    interaction.donate { error in
    //        if let error = error {
    //            print("Failed to donate intent: \(error.localizedDescription)")
    //        } else {
    //            print("Intent donated successfully for title: \(title)")
    //        }
    //    }
    //}

   // private func playAudio(at position: Int) {
    //    let song = duamp3[position]
   //     playAudio(withTitle: song.name)
    //}

  //  private func playAudio(withTitle title: String) {
  //      guard let fileName = duamp3.first(where: { $0.name.lowercased() == title.lowercased() })?.trackName else {
   //         print("No matching audio file found for the custom query.")
   //         return
   //     }

   //     if let path = Bundle.main.path(forResource: fileName, ofType: "mp3") {
   //         let url = URL(fileURLWithPath: path)
//
     //       do {
     //           player = try AVAudioPlayer(contentsOf: url)
     //           player?.play()
     //       } catch {
     //           print("Error playing audio: \(error.localizedDescription)")
     //       }
    //    } else {
    //        print("Audio file not found.")
    //    }
   // }
//}
//struct dmp3 {
  //  let name: String
    //let imageName: String
    //let trackName: String
//}



import AVFoundation
import UIKit
import Intents

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    var player: AVAudioPlayer?
    
    let duaManager = DuaManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self

        INPreferences.requestSiriAuthorization { status in
            if status == .authorized {
                self.donateSiriInteractions()
            } else {
                print("Siri authorization denied.")
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return duaManager.duamp3.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dua = duaManager.duamp3[indexPath.row]

        cell.textLabel?.text = dua.name
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: dua.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 12)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica-Bold", size: 12)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        playAudio(at: indexPath.row)
    }

    private func donateSiriInteractions() {
        for dua in duaManager.duamp3 {
            donateSiriInteraction(withDua: dua)
        }
    }

    private func donateSiriInteraction(withDua dua: dmp3) {
        let playDuaIntent = PlayDuaIntent(duaInfo: dua.trackName)
        let interaction = INInteraction(intent: playDuaIntent, response: nil)

        interaction.donate { error in
            if let error = error {
                print("Failed to donate Siri interaction: \(error.localizedDescription)")
            } else {
                print("Siri interaction donated successfully for Dua: \(dua.name)")
            }
        }
    }

    private func playAudio(at position: Int) {
        let dua = duaManager.duamp3[position]
        playAudio(withDua: dua)
    }

    private func playAudio(withDua dua: dmp3) {
        guard let path = Bundle.main.path(forResource: dua.trackName, ofType: "mp3") else {
            print("Audio file not found.")
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
}
