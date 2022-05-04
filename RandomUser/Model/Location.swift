// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let location = try? newJSONDecoder().decode(Location.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.locationTask(with: url) { location, response, error in
//     if let location = location {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Location
struct Location: Codable, Hashable {
    let street: Street
    let city, state: String
    let postcode: String?
    let coordinates: Coordinates
    let timezone: Timezone
    
    var fullAddress: String {
        self.street.number.description + " " + self.street.name + "\n" + self.city + " " + self.state + " " + (self.postcode ?? "")
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decode(Street.self, forKey: .street)
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
        do {
            self.postcode = try String(container.decode(Int.self, forKey: .postcode))
        } catch {
            do {
                self.postcode = try container.decode(String.self, forKey: .postcode)
            } catch {
                self.postcode = nil
            }
        }
        self.coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        self.timezone = try container.decode(Timezone.self, forKey: .timezone)
    }
}

struct Street: Codable, Hashable {
    let name: String
    let number: Int
}
