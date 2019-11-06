extension ApiResponse.StockTimeSeries {
    public struct MetadataDaily: Decodable {
        let information: String
        let symbol: String
        let lastRefresh: String
        let outputSize: String
        let tz: String
        
        private enum CodingKeys: String, CodingKey {
            case information = "1. Information"
            case symbol = "2. Symbol"
            case lastRefresh = "3. Last Refreshed"
            case outputSize = "4. Output Size"
            case tz = "5. Time Zone"
        }
    }
}
