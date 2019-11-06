@testable import AlphaVantage
import XCTest

private typealias JSON = ApiResponseJSON
private typealias Res = ApiResponse.ApiError

final class ApiErrorTests: XCTestCase {
    func testDecodeErrorRes() {
        guard let data = JSON.error.data(using: .utf8) else {
            XCTFail("Expected `Data` of `error` sample.")
            return
        }

        XCTAssertNoThrow(try JSONDecoder().decode(Res.self, from: data))
    }
}