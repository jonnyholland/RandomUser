// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let login = try? newJSONDecoder().decode(Login.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.loginTask(with: url) { login, response, error in
//     if let login = login {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Login
struct Login: Codable, Hashable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}
