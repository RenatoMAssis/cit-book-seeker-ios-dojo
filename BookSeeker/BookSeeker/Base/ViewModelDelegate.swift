//
//  ViewModelDelegate.swift
//  BookSeeker
//
//  Created by André Alves on 10/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit

protocol ViewModelDelegate: class {
    func showError(title: String, message: String)
}
