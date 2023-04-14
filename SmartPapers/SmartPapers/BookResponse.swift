import Foundation

struct BookResponse: Codable {
    let works: [Work]
}

struct Work: Codable {
    let key, title: String
    let firstPublishYear: Int
    let availability: Availability
    let subtitle: String

    enum CodingKeys: String, CodingKey {
        case key, title
        case firstPublishYear = "first_publish_year"
        case availability, subtitle
    }
}

struct Availability: Codable {
    let isbn: String

    enum CodingKeys: String, CodingKey {
        case isbn
    }
}

