// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let name = try? newJSONDecoder().decode(Name.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.nameTask(with: url) { name, response, error in
//     if let name = name {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Name
struct Name: Codable, Hashable {
    let title, first, last: String
}
