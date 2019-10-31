@testable import AlphaVantage
import XCTest

fileprivate typealias JSON = ApiResponseJSON.StockTimeSeries
fileprivate typealias Res = ApiResponse.StockTimeSeries.STSIntraday

final class STSIntradayTests: XCTestCase {
    func testDecode5minsInterval() {
        guard let data = JSON.intraday5mins.data(using: .utf8) else {
            XCTFail("Expected `Data` of `intraday5mins` sample.")
            return
        }

        XCTAssertNoThrow(try JSONDecoder().decode(Res.self, from: data))
    }

    func testDecode30minsInterval() {
        guard let data = JSON.intraday30mins.data(using: .utf8) else {
            XCTFail("Expected `Data` of `intraday30mins` sample.")
            return
        }

        XCTAssertNoThrow(try JSONDecoder().decode(Res.self, from: data))
    }
}