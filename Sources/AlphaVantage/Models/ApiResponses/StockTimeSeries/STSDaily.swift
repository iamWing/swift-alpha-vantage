extension ApiResponse.StockTimeSeries {
    /// Response model of `TIME_SERIES_DAILY` API.
    public struct STSDaily: Decodable {
        let metadata: MetadataDaily
        let data: [String: MarketDataStandard]
        
        private enum CodingKeys: String, CodingKey {
            case metadata = "Meta Data"
            case data = "Time Series (Daily)"
        }
    }
}
