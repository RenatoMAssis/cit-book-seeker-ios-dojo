// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bookListing = try? newJSONDecoder().decode(BookListing.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.bookListingTask(with: url) { bookListing, response, error in
//     if let bookListing = bookListing {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - BookListing
public struct BookListing: Codable {
	public let resultCount: Int
	public let results: [Book]

	enum CodingKeys: String, CodingKey {
		case resultCount = "resultCount"
		case results = "results"
	}

	public init(resultCount: Int, results: [Book]) {
		self.resultCount = resultCount
		self.results = results
	}
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.resultTask(with: url) { result, response, error in
//     if let result = result {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Result
public struct Book: Codable {
	public let trackCensoredName: String
	public let fileSizeBytes: Int
	public let trackViewURL: String
	public let artworkUrl60: String
	public let artworkUrl100: String
	public let artistViewURL: String
	public let artistIDS: [Int]
	public let trackID: Int
	public let trackName: String
	public let genreIDS: [String]
	public let releaseDate: Date
	public let formattedPrice: String
	public let currency: String
	public let kind: String
	public let artistID: Int
	public let artistName: String
	public let genres: [String]
	public let price: Double
	public let resultDescription: String
	public let averageUserRating: Double?
	public let userRatingCount: Int?

	enum CodingKeys: String, CodingKey {
		case trackCensoredName = "trackCensoredName"
		case fileSizeBytes = "fileSizeBytes"
		case trackViewURL = "trackViewUrl"
		case artworkUrl60 = "artworkUrl60"
		case artworkUrl100 = "artworkUrl100"
		case artistViewURL = "artistViewUrl"
		case artistIDS = "artistIds"
		case trackID = "trackId"
		case trackName = "trackName"
		case genreIDS = "genreIds"
		case releaseDate = "releaseDate"
		case formattedPrice = "formattedPrice"
		case currency = "currency"
		case kind = "kind"
		case artistID = "artistId"
		case artistName = "artistName"
		case genres = "genres"
		case price = "price"
		case resultDescription = "description"
		case averageUserRating = "averageUserRating"
		case userRatingCount = "userRatingCount"
	}

	public init(trackCensoredName: String, fileSizeBytes: Int, trackViewURL: String, artworkUrl60: String, artworkUrl100: String, artistViewURL: String, artistIDS: [Int], trackID: Int, trackName: String, genreIDS: [String], releaseDate: Date, formattedPrice: String, currency: String, kind: String, artistID: Int, artistName: String, genres: [String], price: Double, resultDescription: String, averageUserRating: Double?, userRatingCount: Int?) {
		self.trackCensoredName = trackCensoredName
		self.fileSizeBytes = fileSizeBytes
		self.trackViewURL = trackViewURL
		self.artworkUrl60 = artworkUrl60
		self.artworkUrl100 = artworkUrl100
		self.artistViewURL = artistViewURL
		self.artistIDS = artistIDS
		self.trackID = trackID
		self.trackName = trackName
		self.genreIDS = genreIDS
		self.releaseDate = releaseDate
		self.formattedPrice = formattedPrice
		self.currency = currency
		self.kind = kind
		self.artistID = artistID
		self.artistName = artistName
		self.genres = genres
		self.price = price
		self.resultDescription = resultDescription
		self.averageUserRating = averageUserRating
		self.userRatingCount = userRatingCount
	}
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
	let decoder = JSONDecoder()
	decoder.dateDecodingStrategy = .iso8601
	return decoder
}

func newJSONEncoder() -> JSONEncoder {
	let encoder = JSONEncoder()
	encoder.dateEncodingStrategy = .iso8601
	return encoder
}

// MARK: - URLSession response handlers

public extension URLSession {
	fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		return self.dataTask(with: url) { data, response, error in
			guard let data = data, error == nil else {
				completionHandler(nil, response, error)
				return
			}
			completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
		}
	}

	func bookListingTask(with url: URL, completionHandler: @escaping (BookListing?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		return self.codableTask(with: url, completionHandler: completionHandler)
	}
}
