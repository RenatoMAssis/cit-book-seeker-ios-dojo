//
//  ResultTableViewCellDelegate.swift
//  BookSeeker
//
//  Created by André Alves on 10/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import Foundation

protocol ResultTableViewCellDelegate: class {
    func getArtwork(with imageURL: URL, completion: @escaping ImageCompletionBlock)
}
