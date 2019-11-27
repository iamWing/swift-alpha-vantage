@testable import AlphaVantage
import Foundation
import SwiftyRequest
import XCTest

final class DataExporterTests: XCTestCase {
    let csvSource = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=5min&apikey=demo&datatype=csv"
    let jsonSource = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=5min&apikey=demo"
    
    let fm = FileManager.default
    var csvPath: String!
    var jsonPath: String!
    
    override func setUp() {
        csvPath = fm.currentDirectoryPath + "/test.csv"
        jsonPath = fm.currentDirectoryPath + "/test.json"
    }
    
    override func tearDown() {
        if fm.fileExists(atPath: csvPath) {
           try? fm.removeItem(at: URL(fileURLWithPath: csvPath))
        }
        if fm.fileExists(atPath: jsonPath) {
           try? fm.removeItem(at: URL(fileURLWithPath: jsonPath))
        }
    }
    
    func testExportCSV() {
        let expectation = self.expectation(description: "\(#function)\(#line)")
        var data: Data!
        
        requestDataFromAPI(.csv) { result in
            data = result
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 15)
        
        XCTAssertNoThrow(
            try DataExporter.export(
                data, to: URL(fileURLWithPath: csvPath)
            )
        )
        XCTAssertTrue(fm.fileExists(atPath: csvPath))
    }
    
    func testExportJSON() {
        let expectation = self.expectation(description: "\(#function)\(#line)")
        var data: Data!
        
        requestDataFromAPI(.json) { result in
            data = result
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 15)
        
        XCTAssertNoThrow(
            try DataExporter.export(
                data, to: URL(fileURLWithPath: jsonPath)
            )
        )
        XCTAssertTrue(fm.fileExists(atPath: jsonPath))
    }
    
    private func requestDataFromAPI(
        _ dataType: ApiConst.DataType,
        completion: @escaping (_: Data) -> Void
    ) {
        let request = RestRequest(
            method: .get,
            url: dataType == .csv ? csvSource : jsonSource
        )
        
        request.responseData { result in
            switch result {
            case let .success(res):
                completion(res.body)
            case let .failure(err):
                XCTFail(err.description)
            }
        }
    }
}
