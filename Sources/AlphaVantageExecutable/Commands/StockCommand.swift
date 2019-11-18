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
            break
        case .daily:
            task = {
                fetcher.fetchStockDaily(symbol: self.symbol.value,
                                        completion: completion)
            }
        case .dailyAdjusted:
            break
        }
        
        DispatchQueue.global().async(execute: task)
        dispatchGroup.wait()
    }
    
    enum Function: String, ConvertibleFromString {
        case intraday
        case daily
        case dailyAdjusted = "daily-adjusted"
    }
}


