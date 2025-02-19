import Foundation

struct Movie: Identifiable, Codable {
    var id: Int
    var name: String?
    var rating: Rating?
    var summary: String?
    var image: Images?
    var genres: [String]?
    var language: String?
}

struct Rating: Codable {
    var average: Double?
}

struct Images: Codable {
    var original: String
    var medium: String
}
