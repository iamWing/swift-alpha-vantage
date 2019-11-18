import Foundation
import Configuration
import SwiftCLI

let manager = ConfigurationManager()

manager.load(file: "config.json")
    .load(.environmentVariables)

let apiKey = manager["API_KEY"] as? String

guard apiKey != nil else {
    FileHandle.standardError.write(Const.apiKeyMissing.data(using: .utf8)!)
    exit(1)
}

// The first argument is always the executable, drop it.
let arguments = Array(CommandLine.arguments.dropFirst())

let cli = CLI(
    name: Const.appName,
    version: Const.version,
    description: Const.description
)

cli.commands = [StockCommand()]
let _ = cli.go()
