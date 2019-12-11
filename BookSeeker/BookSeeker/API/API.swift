//
//  API.swift
//  BookSeeker
//
//  Created by André Alves on 09/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//
import UIKit

typealias BookCompletionBlock = (_ book: [Book]?, _ error: Error?) -> Void
typealias ImageCompletionBlock = (_ image: UIImage?, _ error: Error?) -> Void

public class API {
    let baseURL: String = "https://itunes.apple.com"
    static let shared = API()
    func getBooks(by term: String, completionBlock: @escaping BookCompletionBlock) {
        var components = URLComponents(string: baseURL + "/search")
        components?.queryItems = [
            URLQueryItem(name: "term", value: term),
            URLQueryItem(name: "entity", value: "ibook")
        ]
        guard let componentsURL = components, let url = componentsURL.url else {
            return
        }
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10000)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            DispatchQueue.main.async {
                guard error == nil, let dataResponse = data else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
                }
                do {
                    guard let responseJSON = try JSONSerialization.jsonObject(with: dataResponse,
                                                                              options: []) as? [String: Any],
                        let results = responseJSON["results"] as? [[String: Any]] else {
                        return
                    }
                    var books: [Book] = []
                    for result in results {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        if let data = try? JSONSerialization.data(withJSONObject: result, options: []),
                            let book = try? JSONDecoder().decode(Book.self, from: data) {
                            books.append(book)
                        }
                    }
                    completionBlock(books, nil)
                } catch {
                    completionBlock(nil, error)
                }
            }
        }
        task.resume()
    }
    func getArtwork(with artworkURL: URL, completion: @escaping ImageCompletionBlock) {
        let task = URLSession.shared.downloadTask(with: artworkURL) { (url, _, error) in
            DispatchQueue.main.async {
                guard error == nil, let urlResponse = url else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
                }
                do {
                    let data = try Data(contentsOf: urlResponse)
                    let image = UIImage(data: data)
                    completion(image, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}
