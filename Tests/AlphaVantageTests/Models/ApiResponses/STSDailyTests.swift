@testable import AlphaVantage
import XCTest

fileprivate typealias JSON = ApiResponseJSON.StockTimeSeries
fileprivate typealias Res = ApiResponse.StockTimeSeries.STSDaily

final class STSDailyTests: XCTestCase {
    func testDecodeDaily() {
        guard let data = JSON.daily.data(using: .utf8) else {
            XCTFail("Expected `Data` of `daily` sample.")
            return
        }
        
        XCTAssertNoThrow(try JSONDecoder().decode(Res.self, from: data))
    }
}
