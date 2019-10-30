/// Response model of API error with message.
struct ApiError: Codable {
    let errMsg: String

    private enum CodingKeys: String, CodingKey {
        case errMsg = "Error Message"
    }
}
