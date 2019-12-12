//
//  BookModel.swift
//  cit-book-seeker-ios-dojo
//
//  Created by Zied on 11/12/19.
//  Copyright © 2019 ioasys. All rights reserved.
//

import Foundation

public struct BookModel: Codable {
    
    //MARK:- Proprties
    
    public var artworkUrl60:String?
    public var artworkUrl100:String?
    public var artistViewUrl:String?
    public var trackCensoredName:String?
    public var fileSizeBytes:Int?
    public var trackViewUrl:String?
    public var trackName:String?
    public var trackId:Int?
    public var genreIds:[String]?
    public var releaseDate:String?
    public var formattedPrice:String?
    public var artistIds:[Int]?
    public var currency:String?
    public var kind:String?
    public var artistId:Int?
    public var artistName:String?
    public var genres:[String]?
    public var price:Double?
    public var description:String?
    public var averageUserRating:Double?
    public var userRatingCount:Int?
    
    //MARK: - Parsing 
    
    enum CodingKeys: String, CodingKey {
        
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case artistViewUrl = "artistViewUrl"
        case trackCensoredName = "trackCensoredName"
        case fileSizeBytes = "fileSizeBytes"
        case trackViewUrl = "trackViewUrl"
        case trackName = "trackName"
        case trackId = "trackId"
        case genreIds = "genreIds"
        case releaseDate = "releaseDate"
        case formattedPrice = "formattedPrice"
        case artistIds = "artistIds"
        case currency = "currency"
        case kind = "kind"
        case artistId = "artistId"
        case artistName = "artistName"
        case genres = "genres"
        case price = "price"
        case description = "description"
        case averageUserRating = "averageUserRating"
        case userRatingCount = "userRatingCount"
        
    }
    
}
