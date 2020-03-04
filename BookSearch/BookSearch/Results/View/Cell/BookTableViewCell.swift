//
//  BookTableViewCell.swift
//  BookSearch
//
//  Created by Pericles Junor on 01/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit
import SDWebImage

protocol BookTableViewCellProtocol {
    func setupCell(title: String, pictureURL: String)
}

class BookTableViewCell: UITableViewCell, BaseViewProtocol {

    public lazy var lbTitle: UILabel! = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public lazy var ivPicture: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private var viewModel: BookCellViewModelProtocol!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }

    func setup(with book: Book) {
        viewModel = BookCellViewModel(view: self, book: book)
    }

    func setupSubviews() {
        self.addSubview(lbTitle)
        self.addSubview(ivPicture)
        setupConstraints()
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            ivPicture.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            ivPicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            ivPicture.heightAnchor.constraint(equalToConstant: Constant.bookImgHeight),
            ivPicture.widthAnchor.constraint(equalToConstant: Constant.bookImgWidth),
            ivPicture.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),

            lbTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            lbTitle.leadingAnchor.constraint(equalTo: ivPicture.trailingAnchor, constant: 8),
            lbTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
        customSetup()
    }

    func customSetup() {
        self.backgroundColor = .none
        self.selectionStyle = .none
    }
}

extension BookTableViewCell: BookTableViewCellProtocol {
    func setupCell(title: String, pictureURL: String) {
        self.lbTitle.text = title
        self.ivPicture?.sd_setImage(with: URL(string: pictureURL), completed: nil)
    }
}
