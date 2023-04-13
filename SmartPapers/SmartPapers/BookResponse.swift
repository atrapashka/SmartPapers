import Foundation

struct BookResponse: Codable {
    let query: String
    let works: [Work]
    let days, hours: Int
}

// MARK: - Work
struct Work: Codable {
    let key, title: String
    let editionCount, firstPublishYear: Int
    let hasFulltext, publicScanB: Bool
    let ia: [String]?
    let iaCollectionS, lendingEditionS, lendingIdentifierS, coverEditionKey: String?
    let coverI: Int?
    let language: [String]?
    let authorKey, authorName: [String]
    let availability: Availability?
    let idStandardEbooks, idProjectGutenberg: [String]?
    let subtitle: String?
    let idLibrivox: [String]?

    enum CodingKeys: String, CodingKey {
        case key, title
        case editionCount = "edition_count"
        case firstPublishYear = "first_publish_year"
        case hasFulltext = "has_fulltext"
        case publicScanB = "public_scan_b"
        case ia
        case iaCollectionS = "ia_collection_s"
        case lendingEditionS = "lending_edition_s"
        case lendingIdentifierS = "lending_identifier_s"
        case coverEditionKey = "cover_edition_key"
        case coverI = "cover_i"
        case language
        case authorKey = "author_key"
        case authorName = "author_name"
        case availability
        case idStandardEbooks = "id_standard_ebooks"
        case idProjectGutenberg = "id_project_gutenberg"
        case subtitle
        case idLibrivox = "id_librivox"
    }
}

// MARK: - Availability
struct Availability: Codable {
    let status: Status
    let availableToBrowse, availableToBorrow, availableToWaitlist, isPrintdisabled: Bool?
    let isReadable, isLendable: Bool?
    let isPreviewable: Bool
    let identifier: String
    let isbn: String?
    let oclc: JSONNull?
    let openlibraryWork, openlibraryEdition: String?
    let lastLoanDate: Date?
    let numWaitlist: String?
    let lastWaitlistDate: Date?
    let isRestricted: Bool
    let isBrowseable: Bool?
    let src: Src

    enum CodingKeys: String, CodingKey {
        case status
        case availableToBrowse = "available_to_browse"
        case availableToBorrow = "available_to_borrow"
        case availableToWaitlist = "available_to_waitlist"
        case isPrintdisabled = "is_printdisabled"
        case isReadable = "is_readable"
        case isLendable = "is_lendable"
        case isPreviewable = "is_previewable"
        case identifier, isbn, oclc
        case openlibraryWork = "openlibrary_work"
        case openlibraryEdition = "openlibrary_edition"
        case lastLoanDate = "last_loan_date"
        case numWaitlist = "num_waitlist"
        case lastWaitlistDate = "last_waitlist_date"
        case isRestricted = "is_restricted"
        case isBrowseable = "is_browseable"
        case src = "__src__"
    }
}

enum Src: String, Codable {
    case coreModelsLendingGetAvailability = "core.models.lending.get_availability"
}

enum Status: String, Codable {
    case borrowAvailable = "borrow_available"
    case borrowUnavailable = "borrow_unavailable"
    case statusOpen = "open"
    case statusPrivate = "private"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

