// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dob = try? newJSONDecoder().decode(Dob.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.dobTask(with: url) { dob, response, error in
//     if let dob = dob {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Dob
struct Dob: Codable, Hashable {
    let date: String
    let age: Int
}
