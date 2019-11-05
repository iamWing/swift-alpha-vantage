extension ApiResponse {
    /**
     * Namespace of response models related to stock time series APIs.
     */
    public struct StockTimeSeries {
        /// Response model of `TIME_SERIES_INTRADAY` API.
        public struct STSIntraday: Decodable {
            var metadata: Metadata?
            var data: [String: MarketDataStandard]?

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: GenericCodingKeys.self)
                for key in container.allKeys {
                    if key.stringValue == "Meta Data" {
                        metadata = try container.decode(
                            Metadata.self, forKey: key
                        )

                        continue
                    }

                    data = try container.decode(
                        [String: MarketDataStandard].self, forKey: key
                    )
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
        }
    }
}
