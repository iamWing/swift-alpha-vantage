/**
 Constants of APIs provided by Alpha Vantage.
 */
public struct ApiConst {
    static let url = "https://www.alphavantage.co/query?"

    private init() {}

    /// Data type returns from API.
    public enum DataType: String {
        case csv
        case json
    }

    /// Stock data related APIs.
    public enum Stock {
        /**
         Construst the API query string by parameters.

         - parameters:
           - function: The API function of your choice
           - symbol: The symbol of the global security of your choice.
           For example: `symbol=MSFT`
           - dataType: Data format to be returned from API requeset. Default
           format is `.json`
           - apiKey: Your API key. Claim your free API key
           [here](https://www.alphavantage.co/support/#api-key)
         */
        static func api(function: Function,
                        symbol: String,
                        dataType: DataType = .json,
                        apiKey: String) -> String {
            let temp = "\(url)function="
            var api = ""

            switch function {
            case let .intraday(interval):
                api = "\(temp)\(Const.intraday)&interval=\(interval.rawValue)"
            case .daily:
                api = "\(temp)\(Const.daily)"
            case .dailyAdjusted:
                api = "\(temp)\(Const.dailyAdjusted)"
            case .weekly:
                api = "\(temp)\(Const.weekly)"
            case .weeklyAdjusted:
                api = "\(temp)\(Const.weeklyAdjusted)"
            case .monthly:
                api = "\(temp)\(Const.monthly)"
            case .monthlyAdjusted:
                api = "\(temp)\(Const.monthlyAdjusted)"
            case .quoteEndpoint:
                api = "\(temp)\(Const.quoteEndpoint)"
            case let .searchEndpoint(keyword):
                api = "\(temp)\(Const.searchEndpoint)&keywords=\(keyword)"
            }

            switch function {
            case .intraday,
                 .daily,
                 .dailyAdjusted:
                api += "&symbol=\(symbol)&ouputsize=full"
            case .weekly,
                 .weeklyAdjusted,
                 .monthly,
                 .monthlyAdjusted,
                 .quoteEndpoint:
                api += "&symbol=\(symbol)"
            case .searchEndpoint:
                break
            }

            return "\(api)&datatype=\(dataType)&apikey=\(apiKey)"
        }

        /**
         Supported time interval between two consecutive data points in
         intraday time series.
         */
        public enum IntradayInterval: String {
            /// 1 minute interval.
            case min1 = "1min"
            /// 5 minutes interval.
            case min5 = "5min"
            /// 15 minutes interval.
            case min15 = "15min"
            /// 30 minutes interval.
            case min30 = "30min"
            /// 1 hour interval.
            case min60 = "60min"
        }

        /**
         Available APIs provide realtime and historical global equity data.
         Daily, weekly, and monthly time series contain 20+ years of
         historical data.
         */
        enum Function {
            /**
             Intraday time series (timestamp, open, high, low, close, volume)
             of the equity specified.

             - interval: Time interval between two consecutive data points
             in the time series
             */
            case intraday(interval: IntradayInterval)
            /**
             Daily time series (date, daily open, daily high, daily low,
             daily close, daily volume) of the global equity specified.
             */
            case daily
            /**
             Daily time series (date, daily open, daily high, daily low,
             daily close, daily volume, daily adjusted close, and
             split/dividend events) of the global equity specified.
             */
            case dailyAdjusted
            /**
             Weekly adjusted time series (last trading day of each week,
             weekly open, weekly high, weekly low, weekly close, weekly
             adjusted close, weekly volume, weekly dividend) of the global
             equity specified.
             */
            case weekly
            /**
             Weekly adjusted time series (last trading day of each week,
             weekly open, weekly high, weekly low, weekly close, weekly
             adjusted close, weekly volume, weekly dividend) of the global
             equity specified.
             */
            case weeklyAdjusted
            /**
             Monthly time series (last trading day of each month, monthly open,
             monthly high, monthly low, monthly close, monthly volume) of the
             global equity specified.
             */
            case monthly
            /**
             Monthly adjusted time series (last trading day of each month,
             monthly open, monthly high, monthly low, monthly close, monthly
             adjusted close, monthly volume, monthly dividend) of the equity
             specified.
             */
            case monthlyAdjusted
            /**
             A lightweight alternative to the time series APIs, this service
             returns the latest price and volume information for a security of
             your choice.
             */
            case quoteEndpoint
            /**
             Returns the best-matching symbols and market information based on
             keywords of your choice. The search results also contain match
             scores that provide you with the full flexibility to develop your
             own search and filtering logic.

             - keyword: A text string of your choice.
             For example: `keywords=microsoft`.
             */
            case searchEndpoint(keyword: String)
        }

        enum Const: String {
            case intraday = "TIME_SERIES_INTRADAY"
            case daily = "TIME_SERIES_DAILY"
            case dailyAdjusted = "TIME_SERIES_DAILY_ADJUSTED"
            case weekly = "TIME_SERIES_WEEKLY"
            case weeklyAdjusted = "TIME_SERIES_WEEKLY_ADJUSTED"
            case monthly = "TIME_SERIES_MONTHLY"
            case monthlyAdjusted = "TIME_SERIES_MONTHLY_ADJUSTED"
            case quoteEndpoint = "GLOBAL_QUOTE"
            case searchEndpoint = "SYMBOL_SEARCH"
        }
    }
}