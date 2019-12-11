//
//  ResultsViewControllerDelegate.swift
//  BookSeeker
//
//  Created by André Alves on 10/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit
protocol ResultsViewControllerDelegate: class {
    func goToDetails(with row: Int)
    func numberOfRows() -> Int
    func cellForRow(with row: Int) -> (imageURL: String, title: String)
    func getArtwork(with imageURL: URL, completion: @escaping ImageCompletionBlock)
}
