/// Protocol of Alpha Vantage API implementation classes.
public protocol AlphaVantage {
    /// API key provided by Alpha Vantage.
    var apiKey: String { get }
    /// Optional. Data retrieved will be exported to file if set.
    var export: (path: String, dataType: ApiConst.DataType)? { get }

    /**
     Initialiser.

     - parameters:
       - apiKey: API key provided by Alpha Vantage.
       - export: Declares to save the retrieved data as file in specified format & location or not.
     */
    init(apiKey: String, export: (path: String, dataType: ApiConst.DataType)?)
}