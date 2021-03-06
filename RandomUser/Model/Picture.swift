// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let picture = try? newJSONDecoder().decode(Picture.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.pictureTask(with: url) { picture, response, error in
//     if let picture = picture {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Picture
struct Picture: Codable, Hashable {
    let large, medium, thumbnail: String
}
