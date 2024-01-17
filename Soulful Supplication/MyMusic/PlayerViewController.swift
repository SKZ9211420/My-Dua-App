//
//import AVFoundation
//import UIKit
//
//class PlayerViewController: UIViewController {
//
//    public var position: Int = 0
//    //public var duamp3: [dmp3] = []
//
//    @IBOutlet var holder: UIView!
//
//    var player: AVAudioPlayer?
//
//    // User Interface elements
//
//    private let albumImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
//
//    private let songNameLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.numberOfLines = 0 // line wrap
//        return label
//    }()
//
//    private let artistNameLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.numberOfLines = 0 // line wrap
//        return label
//    }()
//
//    private let albumNameLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.numberOfLines = 0 // line wrap
//        return label
//    }()
//
//    let playPauseButton = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        if holder.subviews.count == 0 {
//            configure()
//        }
//    }
//
//    func configure() {
//        // set up player
//        let dmp3 = duamp3[position]
//
//        let urlString = Bundle.main.path(forResource: dmp3.trackName, ofType: "mp3")
//
//        do {
//            try AVAudioSession.sharedInstance().setMode(.default)
//            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
//
//            guard let urlString = urlString else {
//                print("urlstring is nil")
//                return
//            }
//
//            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
//
//            guard let player = player else {
//                print("player is nil")
//                return
//            }
//            //player.volume = 0.5
//
//            player.play()
//        }
//        catch {
//            print("error occurred")
//        }
//
//        // set up user interface elements
//
//        // album cover
//        albumImageView.frame = CGRect(x: 10,
//                                      y: 10,
//                                      width: holder.frame.size.width-20,
//                                      height: holder.frame.size.width-20)
//        albumImageView.image = UIImage(named: dmp3.imageName)
//        holder.addSubview(albumImageView)
//
//        // Labels: Song name, album, artist
//        songNameLabel.frame = CGRect(x: 10,
//                                     y: albumImageView.frame.size.height + 10,
//                                     width: holder.frame.size.width-20,
//                                     height: 70)
//        albumNameLabel.frame = CGRect(x: 10,
//                                     y: albumImageView.frame.size.height + 10 + 70,
//                                     width: holder.frame.size.width-20,
//                                     height: 70)
//        artistNameLabel.frame = CGRect(x: 10,
//                                       y: albumImageView.frame.size.height + 10 + 140,
//                                       width: holder.frame.size.width-20,
//                                       height: 70)
//
//        songNameLabel.text = dmp3.name
//
//        holder.addSubview(songNameLabel)
//        holder.addSubview(albumNameLabel)
//        holder.addSubview(artistNameLabel)
//
//        // Player controls
//        let nextButton = UIButton()
//        let backButton = UIButton()
//
//        // Frame
//        let yPosition = artistNameLabel.frame.origin.y + 70 + 20
//        let size: CGFloat = 50
//
//        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
//                                       y: yPosition,
//                                       width: size,
//                                       height: size)
//
//        nextButton.frame = CGRect(x: holder.frame.size.width - size - 20,
//                                  y: yPosition,
//                                  width: size,
//                                  height: size)
//
//        backButton.frame = CGRect(x: 20,
//                                  y: yPosition,
//                                  width: size,
//                                  height: size)
//
//        // Add actions
//        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
//        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
//        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
//
//        // Styling
//
//        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
//        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
//        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
//
//        playPauseButton.tintColor = .black
//        backButton.tintColor = .black
//        nextButton.tintColor = .black
//
//        holder.addSubview(playPauseButton)
//        holder.addSubview(nextButton)
//        holder.addSubview(backButton)
//
//        // slider
//        let slider = UISlider(frame: CGRect(x: 20,
//                                            y: holder.frame.size.height-60,
//                                            width: holder.frame.size.width-40,
//                                            height: 50))
//        slider.value = 0.5
//        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
//        holder.addSubview(slider)
//    }
//
//    @objc func didTapBackButton() {
//        if position > 0 {
//            position = position - 1
//            player?.stop()
//            for subview in holder.subviews {
//                subview.removeFromSuperview()
//            }
//            configure()
//        }
//    }
//
//    @objc func didTapNextButton() {
//        if position < (duamp3.count - 1) {
//            position = position + 1
//            player?.stop()
//            for subview in holder.subviews {
//                subview.removeFromSuperview()
//            }
//            configure()
//        }
//    }
//
//    @objc func didTapPlayPauseButton() {
//        if player?.isPlaying == true {
//            // pause
//            player?.pause()
//            // show play button
//            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
//
//            // shrink image
//            UIView.animate(withDuration: 0.2, animations: {
//                self.albumImageView.frame = CGRect(x: 30,
//                                                   y: 30,
//                                                   width: self.holder.frame.size.width-60,
//                                                   height: self.holder.frame.size.width-60)
//            })
//        }
//        else {
//            // play
//            player?.play()
//            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
//
//            // increase image size
//            UIView.animate(withDuration: 0.2, animations: {
//                self.albumImageView.frame = CGRect(x: 10,
//                                              y: 10,
//                                              width: self.holder.frame.size.width-20,
//                                              height: self.holder.frame.size.width-20)
//            })
//        }
//    }
//
//    @objc func didSlideSlider(_ slider: UISlider) {
//        let value = slider.value
//        player?.volume = value
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        //super.viewWillDisappear(animated)
//        if let player = player {
//            player.stop()
//        }
//    }
//
//}

import AVFoundation
import UIKit
import Intents

class PlayerViewController: UIViewController, PlayDuaIntentHandling {

    public var position: Int = 0

    @IBOutlet var holder: UIView!

    var player: AVAudioPlayer?

    var duamp3: [dmp3] {
        return DuaManager.shared.duamp3
    }

    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let playPauseButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            configure()
        }
    }

    func configure() {
        let duaManager = DuaManager.shared
        let dmp3 = duaManager.duamp3[position]

        albumImageView.frame = CGRect(x: 10,
                                      y: 10,
                                      width: holder.frame.size.width-20,
                                      height: holder.frame.size.width-20)
        albumImageView.image = UIImage(named: dmp3.imageName)
        holder.addSubview(albumImageView)

        songNameLabel.frame = CGRect(x: 10,
                                     y: albumImageView.frame.size.height + 10,
                                     width: holder.frame.size.width-20,
                                     height: 70)
        albumNameLabel.frame = CGRect(x: 10,
                                      y: albumImageView.frame.size.height + 10 + 70,
                                      width: holder.frame.size.width-20,
                                      height: 70)
        artistNameLabel.frame = CGRect(x: 10,
                                        y: albumImageView.frame.size.height + 10 + 140,
                                        width: holder.frame.size.width-20,
                                        height: 70)

        songNameLabel.text = dmp3.name

        holder.addSubview(songNameLabel)
        holder.addSubview(albumNameLabel)
        holder.addSubview(artistNameLabel)

        let nextButton = UIButton()
        let backButton = UIButton()

        let yPosition = artistNameLabel.frame.origin.y + 70 + 20
        let size: CGFloat = 50

        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
                                       y: yPosition,
                                       width: size,
                                       height: size)

        nextButton.frame = CGRect(x: holder.frame.size.width - size - 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)

        backButton.frame = CGRect(x: 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)

        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)

        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)

        playPauseButton.tintColor = .black
        backButton.tintColor = .black
        nextButton.tintColor = .black

        holder.addSubview(playPauseButton)
        holder.addSubview(nextButton)
        holder.addSubview(backButton)

        let slider = UISlider(frame: CGRect(x: 20,
                                            y: holder.frame.size.height-60,
                                            width: holder.frame.size.width-40,
                                            height: 50))
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        holder.addSubview(slider)
    }

    @objc func didTapBackButton() {
        if position > 0 {
            position = position - 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }

    @objc func didTapNextButton() {
        let duaManager = DuaManager.shared
        if position < (duaManager.duamp3.count - 1) {
            position = position + 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }

    @objc func didTapPlayPauseButton() {
        if player?.isPlaying == true {
            player?.pause()
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)

            UIView.animate(withDuration: 0.2, animations: {
                self.albumImageView.frame = CGRect(x: 30,
                                                   y: 30,
                                                   width: self.holder.frame.size.width-60,
                                                   height: self.holder.frame.size.width-60)
            })
        }
        else {
            player?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)

            UIView.animate(withDuration: 0.2, animations: {
                self.albumImageView.frame = CGRect(x: 10,
                                                   y: 10,
                                                   width: self.holder.frame.size.width-20,
                                                   height: self.holder.frame.size.width-20)
            })
        }
    }

    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }

    // MARK: - PlayDuaIntentHandling

    func handle(intent: PlayDuaIntent, completion: @escaping (PlayDuaIntentResponse) -> Void) {
        if let duaTitle = intent.duaInfo {
            playDuaAudio(withTitle: duaTitle)

            let response = PlayDuaIntentResponse()
            response.responseCode = .success
            completion(response)
        } else {
            let response = PlayDuaIntentResponse()
            response.responseCode = .customFailure
            completion(response)
        }
    }

    // MARK: - Private Methods

    private func playDuaAudio(withTitle title: String) {
        guard let path = Bundle.main.path(forResource: title, ofType: "mp3") else {
            print("Audio file not found.")
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error setting up audio session or playing audio: \(error.localizedDescription)")
        }
    }
}
