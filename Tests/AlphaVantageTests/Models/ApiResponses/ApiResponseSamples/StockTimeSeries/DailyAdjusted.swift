extension ApiResponseJSON.StockTimeSeries {
    static let dailyAdjusted = """
    {
    "Meta Data": {
        "1. Information": "Daily Time Series with Splits and Dividend Events",
        "2. Symbol": "MSFT",
        "3. Last Refreshed": "2019-11-04",
        "4. Output Size": "Compact",
        "5. Time Zone": "US/Eastern"
    },
    "Time Series (Daily)": {
        "2019-11-04": {
            "1. open": "144.8300",
            "2. high": "145.0000",
            "3. low": "144.1600",
            "4. close": "144.5500",
            "5. adjusted close": "144.5500",
            "6. volume": "16890782",
            "7. dividend amount": "0.0000",
            "8. split coefficient": "1.0000"
        },
        "2019-11-01": {
            "1. open": "144.2600",
            "2. high": "144.4200",
            "3. low": "142.9700",
            "4. close": "143.7200",
            "5. adjusted close": "143.7200",
            "6. volume": "33119200",
            "7. dividend amount": "0.0000",
            "8. split coefficient": "1.0000"
        },
        "2019-10-31": {
            "1. open": "144.9000",
            "2. high": "144.9300",
            "3. low": "142.9900",
            "4. close": "143.3700",
            "5. adjusted close": "143.3700",
            "6. volume": "24596200",
            "7. dividend amount": "0.0000",
            "8. split coefficient": "1.0000"
        },
        "2019-10-30": {
            "1. open": "143.5200",
            "2. high": "145.0000",
            "3. low": "142.7900",
            "4. close": "144.6100",
            "5. adjusted close": "144.6100",
            "6. volume": "18471700",
            "7. dividend amount": "0.0000",
            "8. split coefficient": "1.0000"
        },
        "2019-10-29": {
            "1. open": "144.0800",
            "2. high": "144.5000",
            "3. low": "142.6500",
            "4. close": "142.8300",
            "5. adjusted close": "142.8300",
            "6. volume": "20519700",
            "7. dividend amount": "0.0000",
            "8. split coefficient": "1.0000"
        }
    }
    }
    """
}
