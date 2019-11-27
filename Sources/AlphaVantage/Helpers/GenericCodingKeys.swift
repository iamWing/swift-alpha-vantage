/// `CodingKey` struct for dynamic keys.
struct GenericCodingKeys: CodingKey {
    var intValue: Int?
    var stringValue: String

    init?(intValue: Int) {
        self.intValue = intValue
        stringValue = "\(intValue)"
    }

    init?(stringValue: String) {
        self.stringValue = stringValue
    }
}