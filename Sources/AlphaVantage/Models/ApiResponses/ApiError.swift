public struct ApiResponse {
    /// Response model of API error with message.
    public struct ApiError: Codable, Error {
        public let errMsg: String

        private enum CodingKeys: String, CodingKey {
            case errMsg = "Error Message"
        }
    }
}
