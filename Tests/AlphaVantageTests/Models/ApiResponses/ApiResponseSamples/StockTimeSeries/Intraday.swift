extension ApiResponseJSON {
    /// JSON response samples of Stock Time Series APIs
    struct StockTimeSeries {
        private init() {}

        static let intraday5mins = """
        {
        "Meta Data": {
            "1. Information": "Intraday (5min) open, high, low, close prices and volume",
            "2. Symbol": "MSFT",
            "3. Last Refreshed": "2019-10-30 16:00:00",
            "4. Interval": "5min",
            "5. Output Size": "Compact",
            "6. Time Zone": "US/Eastern"
        },
        "Time Series (5min)": {
            "2019-10-30 16:00:00": {
                "1. open": "144.6800",
                "2. high": "144.7300",
                "3. low": "144.4700",
                "4. close": "144.5700",
                "5. volume": "784278"
            },
            "2019-10-30 15:55:00": {
                "1. open": "144.6000",
                "2. high": "144.7700",
                "3. low": "144.6000",
                "4. close": "144.6750",
                "5. volume": "448013"
            }
        }
        }
        """

        static let intraday30mins = """
        {
        "Meta Data": {
            "1. Information": "Intraday (30min) open, high, low, close prices and volume",
            "2. Symbol": "MSFT",
            "3. Last Refreshed": "2019-10-30 16:00:00",
            "4. Interval": "30min",
            "5. Output Size": "Compact",
            "6. Time Zone": "US/Eastern"
        },
        "Time Series (30min)": {
            "2019-10-30 16:00:00": {
                "1. open": "144.6000",
                "2. high": "144.7800",
                "3. low": "144.4700",
                "4. close": "144.5700",
                "5. volume": "2150263"
            },
            "2019-10-30 15:30:00": {
                "1. open": "144.1800",
                "2. high": "144.9700",
                "3. low": "144.1700",
                "4. close": "144.6000",
                "5. volume": "2046308"
            }
        }
        }
        """
    }
}
