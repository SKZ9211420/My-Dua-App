import Intents

@available(iOS 15.0, *)
public class PlayDuaIntent: INIntent {
    @objc public var duaInfo: String?

    public override init() {
        super.init()
    }

    @objc required public init?(coder: NSCoder) {
        self.duaInfo = coder.decodeObject(forKey: "duaInfo") as? String
        super.init(coder: coder)
    }

    @objc public init(duaInfo: String?) {
        super.init()
        self.duaInfo = duaInfo
    }
}
