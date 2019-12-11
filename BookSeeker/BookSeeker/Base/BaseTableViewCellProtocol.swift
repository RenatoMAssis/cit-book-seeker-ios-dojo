//
//  BaseTableViewCellProtocol.swift
//  BookSeeker
//
//  Created by André Alves on 09/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit

protocol BaseTableViewCellProtocol {
    static var identifier: String { get }
    static var nib: UINib { get }
}
