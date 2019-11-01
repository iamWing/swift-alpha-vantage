extension ApiResponse {
    /**
     * Namespace of response models related to stock time series APIs.
     */
    public struct StockTimeSeries {
        /// Response model of `TIME_SERIES_INTRADAY` API.
        public struct STSIntraday: Decodable {
            var metadata: Metadata?
            var data: [String: MarketData]?

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: GenericCodingKeys.self)
                for key in container.allKeys {
                    if key.stringValue == "Meta Data" {
                        metadata = try container.decode(Metadata.self, forKey: key)

                        continue
                    }

                    data = try container.decode([String: MarketData].self, forKey: key)
                }
            }

            public struct Metadata: Decodable {
                let information: String
                let symbol: String
                let lastRefresh: String
                let interval: String
                let outputSize: String
                let tz: String

                private enum CodingKeys: String, CodingKey {
                    case information = "1. Information"
                    case symbol = "2. Symbol"
                    case lastRefresh = "3. Last Refreshed"
                    case interval = "4. Interval"
                    case outputSize = "5. Output Size"
                    case tz = "6. Time Zone"
                }
            }

            public struct MarketData: Decodable {
                let open: String
                let high: String
                let low: String
                let close: String
                let volume: String

                private enum CodingKeys: String, CodingKey {
                    case open = "1. open"
                    case high = "2. high"
                    case low = "3. low"
                    case close = "4. close"
                    case volume = "5. volume"
                }
            }
        }
    }
}