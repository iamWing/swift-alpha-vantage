extension ApiResponse.StockTimeSeries {
    /// Response model of `TIME_SERIES_DAILY_ADJUSTED` API.
    public struct STSDailyAdjusted: Decodable {
        let metadata: MetadataDaily
        let data: [String: MarketDataAdjusted]
        
        private enum CodingKeys: String, CodingKey {
            case metadata = "Meta Data"
            case data = "Time Series (Daily)"
        }
        
        public struct MarketDataAdjusted: Decodable {
            let open: String
            let high: String
            let low: String
            let close: String
            let adjustedClose: String
            let volume: String
            let dividendAmount: String
            let splitCoefficient: String
            
            private enum CodingKeys: String, CodingKey {
                case open = "1. open"
                case high = "2. high"
                case low = "3. low"
                case close = "4. close"
                case adjustedClose = "5. adjusted close"
                case volume = "6. volume"
                case dividendAmount = "7. dividend amount"
                case splitCoefficient = "8. split coefficient"
            }
        }
    }
}
