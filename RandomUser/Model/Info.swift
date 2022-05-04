// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let info = try? newJSONDecoder().decode(Info.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.infoTask(with: url) { info, response, error in
//     if let info = info {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Info
struct Info: Codable, Hashable {
    let seed: String
    let results, page: Int
    let version: String
}
