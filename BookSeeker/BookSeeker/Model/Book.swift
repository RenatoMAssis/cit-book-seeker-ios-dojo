//
//  Book.swift
//  BookSeeker
//
//  Created by André Alves on 09/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import Foundation

struct Book: Decodable {
    var artworkUrl60: String
    var artworkUrl100: String
    var trackName: String
    var releaseDate: String
    var genres: [String]
    var artistName: String
    var description: String
    var price: Double?
    var currency: String
    var averageUserRating: Double?
}
