import Foundation
import SwiftCLI
import AlphaVantage

class StockCommand: Command {
    let name = StockCMDConst.name
    let shortDescription = StockCMDConst.desc
    
    let function = Param.Required<Function>()
    let intradayInterval = Key<Int>(
        "-i", "--interval",
        description: StockCMDConst.intradayIntervalDesc
    )
    
    let symbol = Parameter()
    
    let outPath = Key<String>("-o", "--output",
                              description: StockCMDConst.outPathDesc)
    
    let dataType = Flag("--csv",
                        description: StockCMDConst.dataTypeDesc)

    func execute() throws {
        unowned let fm = FileManager.default
        let dispatchGroup = DispatchGroup()
        
        let outPath = self.outPath.value == nil ?
            fm.currentDirectoryPath : self.outPath.value!

        let fetcher = Stock(
            apiKey: apiKey!,
            export: (path: URL(fileURLWithPath: outPath),
                     dataType: dataType.value ? .csv : .json)
        )
        
        dispatchGroup.enter()
        var task: () -> Void = {}
        let completion: (_: Any, _: Error?) -> Void = { _, err in
            if let err = err {
                guard let apiErr = err as? ApiResponse.ApiError else {
                    self.stderr <<< err.localizedDescription
                    dispatchGroup.leave()
                    return
                }
                
                self.stderr <<< apiErr.errMsg
            }
            
            dispatchGroup.leave()
        }

        switch function.value {
        case .intraday:
            let intervalVal = IntradayInterval.init(
                rawValue: intradayInterval.value ?? 5
            )

            task = {
                var interval = ApiConst.Stock.IntradayInterval.min5
                
                switch intervalVal {
                case .min1:
                    interval = ApiConst.Stock.IntradayInterval.min1
                case .min5:
                    interval = ApiConst.Stock.IntradayInterval.min5
                case .min15:
                    interval = ApiConst.Stock.IntradayInterval.min15
                case .min30:
                    interval = ApiConst.Stock.IntradayInterval.min30
                case .min60:
                    interval = ApiConst.Stock.IntradayInterval.min60
                default:
                    self.stderr <<< StockCMDConst.invalidIntradayIntervalVal
                    dispatchGroup.leave()
                    return
                }

                fetcher.fetchStockIntraday(symbol: self.symbol.value,
                                           interval: interval,
                                           completion: completion)
            }
        case .daily:
            task = {
                fetcher.fetchStockDaily(symbol: self.symbol.value,
                                        completion: completion)
            }
        case .dailyAdjusted:
            task = {
                fetcher.fetchStockDailyAdjusted(symbol: self.symbol.value,
                                                completion: completion)
            }
        }
        
        DispatchQueue.global().async(execute: task)
        dispatchGroup.wait()
    }
    
    enum Function: String, ConvertibleFromString {
        case intraday
        case daily
        case dailyAdjusted = "daily-adjusted"
    }
    
    private enum IntradayInterval: Int {
        case min1 = 1
        case min5 = 5
        case min15 = 15
        case min30 = 30
        case min60 = 60
    }
}


