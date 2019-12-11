//
//  LastSearchesTableViewCell.swift
//  BookSeeker
//
//  Created by André Alves on 09/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit

class LastSearchesTableViewCell: UITableViewCell, BaseTableViewCellProtocol {
    static var identifier: String {
        return "LastSearchesTableViewCell"
    }
    static var nib: UINib {
        return UINib(nibName: LastSearchesTableViewCell.identifier, bundle: .main)
    }
    @IBOutlet weak var lblTitle: UILabel!
    func configure(with title: String) {
        lblTitle.text = title
    }
}
