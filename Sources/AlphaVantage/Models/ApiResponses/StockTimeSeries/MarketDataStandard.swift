extension ApiResponse.StockTimeSeries {
    public struct MarketDataStandard: Decodable {
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
