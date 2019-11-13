//
//  URLSessionExtensions.swift
//  BookSeeker
//
//  Created by André Braga on 13/11/19.
//  Copyright © 2019 renatom.ciandt. All rights reserved.
//

import Foundation

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
