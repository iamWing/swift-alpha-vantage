import Foundation

/// Utility to write binary data to file & save in specified location.
struct DataExporter {
    private init() {}
    
    /// Export `Data` to file in specified location.
    /// - Parameters:
    ///   - data: Binary data to be written to target location.
    ///   - path: Full path of the targeted location, including file name & file extension.
    ///   e.g. `/root/file.json
    static func export(_ data: Data, to path: URL) throws {
        try data.write(to: path, options: .atomic)
    }
}
