//
//  Book.swift
//  BookSearch
//
//  Created by Pericles Junor on 01/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class Book {
    
    var title: String!
    var artwork: String!
    var description: String!

    init(title: String, artwork: String, description: String) {
        self.title = title
        self.artwork = artwork
        self.description = description
    }
}
