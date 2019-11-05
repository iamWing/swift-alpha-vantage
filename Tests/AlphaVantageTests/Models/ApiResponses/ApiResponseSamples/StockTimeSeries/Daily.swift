extension ApiResponseJSON.StockTimeSeries {
    static let daily = """
    {
    "Meta Data": {
        "1. Information": "Daily Prices (open, high, low, close) and Volumes",
        "2. Symbol": "MSFT",
        "3. Last Refreshed": "2019-11-04",
        "4. Output Size": "Full size",
        "5. Time Zone": "US/Eastern"
    },
    "Time Series (Daily)": {
        "2019-11-04": {
            "1. open": "144.8300",
            "2. high": "145.0000",
            "3. low": "144.1600",
            "4. close": "144.5500",
            "5. volume": "16890782"
        },
        "2019-11-01": {
            "1. open": "144.2600",
            "2. high": "144.4200",
            "3. low": "142.9700",
            "4. close": "143.7200",
            "5. volume": "33119200"
        },
        "2019-10-31": {
            "1. open": "144.9000",
            "2. high": "144.9300",
            "3. low": "142.9900",
            "4. close": "143.3700",
            "5. volume": "24596200"
        },
        "2019-10-30": {
            "1. open": "143.5200",
            "2. high": "145.0000",
            "3. low": "142.7900",
            "4. close": "144.6100",
            "5. volume": "18471700"
        },
        "2019-10-29": {
            "1. open": "144.0800",
            "2. high": "144.5000",
            "3. low": "142.6500",
            "4. close": "142.8300",
            "5. volume": "20519700"
        }
    }
    }
    """
}
