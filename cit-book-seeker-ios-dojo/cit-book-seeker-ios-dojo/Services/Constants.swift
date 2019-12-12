//
//  Constants.swift
//  cit-book-seeker-ios-dojo
//
//  Created by ioasys on 11/12/19.
//  Copyright © 2019 ioasys. All rights reserved.
//

import Foundation

public typealias CompletionHandler = (_ Success: Bool, _ data:Data?) -> ()

//Header
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]

let BASE_URL = "https://itunes.apple.com/search?term=swift&entity=ibook"
