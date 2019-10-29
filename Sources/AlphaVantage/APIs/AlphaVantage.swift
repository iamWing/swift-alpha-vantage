/// Protocol of Alpha Vantage API implementation classes.
public protocol AlphaVantage {
    var apiKey: String { get }

    init(apiKey: String)
}