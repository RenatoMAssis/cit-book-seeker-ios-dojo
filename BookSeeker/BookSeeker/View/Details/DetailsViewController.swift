//
//  DetailsViewController.swift
//  BookSeeker
//
//  Created by André Alves on 11/12/19.
//  Copyright © 2019 André Alves. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userRatingLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    var delegate: DetailsViewControllerDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate.didLoad()
    }
    func configureView(with imageURL: URL,
                       and title: String,
                       and description: String,
                       and userRating: Double,
                       and author: String) {
        artworkImageView.image = try? UIImage(data: Data(contentsOf: imageURL))
        self.title = title
        descriptionLabel.text = description
        userRatingLabel.text = "User rating: \(userRating)/5.0"
        authorLabel.text = "Author: \(author)"
    }
}
