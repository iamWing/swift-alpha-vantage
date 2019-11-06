@testable import AlphaVantage
import XCTest

fileprivate typealias JSON = ApiResponseJSON.StockTimeSeries
fileprivate typealias Res = ApiResponse.StockTimeSeries.STSDailyAdjusted

final class STSDailyAdjustedTests: XCTestCase {
    func testDecodeDailyAdjusted() {
        guard let data = JSON.dailyAdjusted.data(using: .utf8) else {
            XCTFail("Expected `Data` of `dailyAdjusted` sample.")
            return
        }
        
        XCTAssertNoThrow(try JSONDecoder().decode(Res.self, from: data))
    }
}
