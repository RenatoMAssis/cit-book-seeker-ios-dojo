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
    var kind: String!
    var author: String!
    var artwork: String!
    var description: String!

    init(title: String,
         artwork: String,
         description: String,
         author: String,
         kind: String) {

        self.kind = kind
        self.title = title
        self.author = author
        self.artwork = artwork
        self.description = description
    }
}
