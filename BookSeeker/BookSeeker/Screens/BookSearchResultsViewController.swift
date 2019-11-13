//
//  BookSearchResultsViewController.swift
//  BookSeeker
//
//  Created by André Braga on 13/11/19.
//  Copyright © 2019 renatom.ciandt. All rights reserved.
//

import UIKit

class BookSearchResultsViewController: UIViewController {

	private var books: [Book] = []

	convenience init(books: [Book]) {
		self.init()
		self.books = books
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

}
