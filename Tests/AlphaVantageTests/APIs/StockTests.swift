@testable import AlphaVantage
import XCTest
import Foundation
import SwiftyRequest

private typealias Interval = ApiConst.Stock.IntradayInterval

final class StockTests: XCTestCase {
    let fm = FileManager.default
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
    
    func testFetchStockIntradatExport() {
        let expectation = self.expectation(description: "\(#function)\(#line)")
        
        let path = fm.currentDirectoryPath

        instance = Stock(
            apiKey: PrivateConst.apiKey,
            export: (path: URL(fileURLWithPath: path), dataType: .json)
        )
        
        instance.fetchStockIntraday(symbol: symbol, interval: .min5) {
            result, err in
            XCTAssertNotNil(result?.metadata)
            XCTAssertNotNil(result?.data)
            
            XCTAssertEqual(result?.metadata?.symbol, self.symbol)
            XCTAssertEqual(result?.metadata?.interval, Interval.min5.rawValue)
            
            XCTAssertTrue(self.fm.fileExists(
                atPath: "\(path)/intraday_5min_\(self.symbol).json"
            ))
            
            print(err ?? "")
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 15)
        
        try? fm.removeItem(
            at: URL(fileURLWithPath: "\(path)/intraday_5min_\(symbol).json")
        )
    }
    
    func testFetchStockDaily() {
        let expectation = self.expectation(description: "\(#function)\(#line)")
        
        instance.fetchStockDaily(symbol: symbol) { result, err in
            XCTAssertNotNil(result?.metadata)
            XCTAssertNotNil(result?.data)
            XCTAssertEqual(result?.metadata.symbol, self.symbol)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 15)
    }
    
    func testFetchStockDailyFailed() {
        let expectation = self.expectation(description: "\(#function)\(#line)")

        instance = Stock(apiKey: "")
        
        instance.fetchStockDaily(symbol: symbol) { result, err in
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
    
    func testFetchStockDailyExport() {
        let expectation = self.expectation(description: "\(#function)\(#line)")
        
        let path = fm.currentDirectoryPath
        
        instance = Stock(
            apiKey: PrivateConst.apiKey,
            export: (path: URL(fileURLWithPath: path), dataType: .json)
        )
        
        instance.fetchStockDaily(symbol: symbol) { result, err in
            XCTAssertNotNil(result?.metadata)
            XCTAssertNotNil(result?.data)
            XCTAssertEqual(result?.metadata.symbol, self.symbol)

            XCTAssertTrue(self.fm.fileExists(
                atPath: "\(path)/daily_\(self.symbol).json"
            ))
            
            print(err ?? "")
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 15)
    }
}
