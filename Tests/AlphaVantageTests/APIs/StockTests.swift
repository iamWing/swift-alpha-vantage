@testable import AlphaVantage
import XCTest
import SwiftyRequest

private typealias Interval = ApiConst.Stock.IntradayInterval

final class StockTests: XCTestCase {
    var instance: Stock!
    let symbol = "MSFT"

    override func setUp() {
        super.setUp()

        instance = Stock(apiKey: PrivateConst.apiKey)
    }

    func testFetchStockIntraday() {
        let expectation = self.expectation(description: "\(#function)\(#line)")

        instance.fetchStockIntraday(symbol: symbol, interval: .min15) {
            result, err in
            XCTAssertNotNil(result?.metadata)
            XCTAssertNotNil(result?.data)

            XCTAssertEqual(result?.metadata?.symbol, self.symbol)
            XCTAssertEqual(result?.metadata?.interval, Interval.min15.rawValue)

            expectation.fulfill()
        }

        waitForExpectations(timeout: 15)
    }

    func testFetchStockIntradayFail() { 
        let expectation = self.expectation(description: "\(#function)\(#line)")

        instance = Stock(apiKey: "")

        instance.fetchStockIntraday(symbol: symbol, interval: .min5) {
            result, err in 
            XCTAssertNil(result)
            XCTAssertNotNil(err)

            let apiErr = err as? ApiResponse.ApiError
            XCTAssertNotNil(apiErr)

            if (apiErr == nil) {
                print(err.debugDescription)
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: 15)
    }
}