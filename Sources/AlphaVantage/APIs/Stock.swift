import Foundation
import SwiftyRequest

private typealias Res = ApiResponse.StockTimeSeries
private typealias ErrRes = ApiResponse.ApiError

/// Implementation of APIs under `Stock Time Series` on Alpha Vantage.
public class Stock: AlphaVantage {
    public var apiKey: String
    public var export: (path: String, dataType: ApiConst.DataType)?

    public required init(
        apiKey: String,
        export: (path: String, dataType: ApiConst.DataType)? = nil
    ) {
        self.apiKey = apiKey
        self.export = export
    }

    /**
     Request stock intraday market data from API.

     - parameters:
       - symbol: The symbol of target equity.
       - interval: Time interval between two consecutive data points in the
       time series.
       - completion: A closure to be executed once the request has finished.
     */
    public func fetchStockIntraday(
        symbol: String,
        interval: ApiConst.Stock.IntradayInterval,
        completion: @escaping (
            _ result: ApiResponse.StockTimeSeries.STSIntraday?,
            _ err: Error?
        ) -> Void
    ) {
        let apiUrl = ApiConst.Stock.api(
            function: .intraday(interval: interval),
            symbol: symbol,
            dataType: export?.dataType ?? .json,
            apiKey: apiKey
        )

        let request = RestRequest(method: .get, url: apiUrl)
        // Uses `.responseData` instead of `.responseObject` to avoid
        // implementing another response block to retrieve binary `Data`
        // for exporting JSON/CSV file.
        request.responseData { result in
            switch result {
            case let .success(res):
                guard let decoded = try? JSONDecoder().decode(
                    Res.STSIntraday.self, from: res.body
                ) else {
                    if let errRes = try? JSONDecoder().decode(
                        ErrRes.self, from: res.body
                    ) {
                        completion(nil, errRes)
                    } else {
                        completion(nil, ErrRes(errMsg: "Unknown Error"))
                    }

                    return
                }

                completion(decoded, nil)
            case let .failure(err):
                completion(nil, err)
            }
        }
    }
}