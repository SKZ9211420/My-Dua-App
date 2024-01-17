//import Intents

//@available(iOS 15.0, *)
//public class PlayDuaIntentResponse: INIntentResponse {
  //  public override init() {
   //     super.init()
    //}

    //public required init?(coder: NSCoder) {
      //  super.init(coder: coder)
   // }
//}


// DuaApp/PlayDuaIntentResponse.swift

// DuaApp/PlayDuaIntentResponse.swift

import Intents

public class PlayDuaIntentResponse: INIntentResponse {
    public var responseCode: PlayDuaIntentResponseCode = .success

    public override init() {
        super.init()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public enum PlayDuaIntentResponseCode: Int {
        case success
        case customFailure
    }
}
