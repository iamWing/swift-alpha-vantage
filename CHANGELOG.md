# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog], and this project adheres to 
[Semantic Versioning].

## [Unreleased]

## [0.1.0] - 2019-11-27

### Added
- Swift library module `AlphaVantage`:
  - Partial implementation of `Stock Time Series` functions including 
    `TIME_SERIES_INTRADAY`, `TIME_SERIES_DAILY`, and 
    `TIME_SERIES_DAILY_ADJUSTED`.
- Command line executable:
  - Basic command line interface.
  - Command `sav stock <intraday/daily/daily-adjusted> <symbol> [options]`

[Keep a Changelog]: https://keepachangelog.com/en/1.0.0/
[Semantic Versioning]: https://semver.org/spec/v2.0.0.html
[Unreleased]: https://github.com/iamWing/swift-alpha-vantage/compare/0.1.0...HEAD
[0.1.0]: https://github.com/iamWing/swift-alpha-vantage/releases/tag/0.1.0
