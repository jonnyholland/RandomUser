// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let iD = try? newJSONDecoder().decode(ID.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.iDTask(with: url) { iD, response, error in
//     if let iD = iD {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - ID
struct ID: Codable, Hashable {
    let name, value: String?
}
