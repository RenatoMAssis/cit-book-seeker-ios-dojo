//
//  ResultTableViewCell.swift
//  BookSeeker
//
//  Created by André Alves on 10/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell, BaseTableViewCellProtocol {
    static var identifier: String {
        return "ResultTableViewCell"
    }
    static var nib: UINib {
        return UINib(nibName: ResultTableViewCell.identifier, bundle: .main)
    }
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    weak var delegate: ResultTableViewCellDelegate?
    func configureCell(with imageURL: URL, and title: String, and delegate: ResultTableViewCellDelegate) {
        titleLabel.text = title
        self.delegate = delegate
        activityIndicator.startAnimating()
        delegate.getArtwork(with: imageURL) { (image, error) in
            self.activityIndicator.stopAnimating()
            if error != nil, let image = image {
                self.artworkImageView.image = image
            }
        }
    }
}
