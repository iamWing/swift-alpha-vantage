# swift-alpha-vantage

_Swift package to get market data from Alpha Vantage APIs_

[Alpha Vantage] provides a set of free APIs for realtime and historical data on stocks, 
forex (FX), and digital/crypto currencies. This package implements a command line script and 
a Swift module to the free APIs provided by Alpha Vantage.

This package requires a free API key from Alpha Vantage in order to fetch market data there. 
The API key can be requested on http://www.alphavantage.co/support/#api-key

## Getting Started

#### _Before you get started_

_This package is written and tested on macOS & Ubuntu, whereas iOS has not been 
tested and not guaranteed to work. You are welcome to give it a try and post an 
issue to let me know if it works or not, thanks._

### Using as dependency via Swift Package Manager

#### Add dependencies

Add `swift-alpha-vantage` to the dependencies within your application's 
`Package.swift` file. Substitute `"x.x.x" with the latest `swift-alpha-vantage` 
[release].

```Swift
.package(url: "https://github.com/iamWing/swift-alpha-vantage", from: "x.x.x")
```

Add `AlphaVantage` to your target's dependencies:
```Swift
.target(name: "example", dependencies: ["AlphaVantage"])
```

#### Initialise AlphaVantage

```Swift
import Foundation
import AlphaVantage

let fetcher = Stock(
    apiKey: "alpha_vantage_api_key",
    export: (path: URL(fileURLWithPath: "."), dataType: .json)
)
```

#### Fetching market data

```Swift
fetcher.fetchStockIntraday(symbol: "MSFT", interval: .min15) { result, err in
    if let err = err {
        guard let apiErr = err as? ApiResponse.ApiError else {
            self.stderr <<< err.localizedDescription
            return
        }
        
        self.stderr <<< apiErr.errMsg
    }
}
```

### Command line executable

#### Download Swift Alpha Vantage

```sh
curl https://github.com/iamWing/swift-alpha-vantage/releases/download/x.x.x/sav -o sav
```

#### Configure API Key

The Alpha Vantage API key can be configured via either environment variable 
`API_KEY` or a separate `config.json` file alongside the executable file `sav`.

_If both environment variable `API_KEY` and `config.json` file are both 
configured, the api key declared in environment variable will be used for the 
convenience of quick api key modification._

```sh
# By environment variable
export API_KEY=your_api_key
```

```sh
# config.json
{
    "API_KEY": "your_api_key"
}
```

#### Usage

```sh
sav stock <function> <symbol> [options]

# e.g.
sav stock intraday -i 5 -o /home/ MSFT

# Available API functions:
# intraday, daily, daily-adjusted
```

## Remarks

The development of this package is still in early days, therefore only a few API functions 
provided by Alpha Vantage are implemented atm. Given the limited amount of free time I have 
recently, the progress on the remaining functions is likely to be slow in the foreseeable 
future. You're more than welcome to participate the development if you've got the time. 

## Contributions

Contributions via pull requests are welcome and encouraged :)

## Author

[Wing Chau] [@Devtography]

## License

swift-alpha-vantage is licensed under the [MIT License](LICENSE).

[Alpha Vantage]: https://www.alphavantage.co
[release]: https://github.com/iamWing/swift-alpha-vantage/releases
[Wing Chau]: https://github.com/iamWing
[@Devtography]: https://github.com/Devtography
