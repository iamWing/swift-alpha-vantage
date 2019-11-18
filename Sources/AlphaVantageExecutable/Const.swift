/// Constants for Alpha Vantage CLI app.
struct Const {
    private init() {}
    
    static let appName = "Swift Alpha Vantage"
    static let version = "1.0.0"
    static let description =
    "Swift Alpha Vantage - Unofficial Swift wrapper of Alpha Vantage APIs"
    static let cmd = "sav"
    static let apiKeyMissing = "Missing API key. Aborting...\n"
}

/// Constants for command - stock
struct StockCMDConst {
    private init() {}
    
    static let name = "stock"
    static let desc = "Fetch stocks market data"
    
    static let intradayIntervalDesc =
    "Intraday interval;\nAvailable options: 1, 5, 15, 30, 60"
    
    static let outPathDesc = """
    Output path for market data downloaded;
    Data will be saved at current directory by default
    """
    
    static let dataTypeDesc = """
    Fetch data in CSV format;
    Data fetched will be in JSON format if not specified
    """
}
