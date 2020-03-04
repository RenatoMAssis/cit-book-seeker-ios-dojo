//
//  BookInfoView.swift
//  BookSearch
//
//  Created by Pericles Junor on 03/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class BookInfoView: UIView, BaseViewProtocol {

    public lazy var lbTitle: UILabel! = { return setupLabel(fontSize: 15) }()
    public lazy var lbAuthor: UILabel! = { return setupLabel(fontSize: 15) }()
    public lazy var lbKind: UILabel! = { return setupLabel(fontSize: 15) }()
    public lazy var lbDescription: UILabel! = { return setupLabel(fontSize: 15) }()

    public lazy var ivPicture: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }

    func setupLabel(fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func setupSubviews() {
        self.addSubview(lbKind)
        self.addSubview(lbTitle)
        self.addSubview(lbAuthor)
        self.addSubview(ivPicture)
        self.addSubview(lbDescription)
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            ivPicture.topAnchor.constraint(equalTo: self.topAnchor),
            ivPicture.widthAnchor.constraint(equalToConstant: Constant.bookImgWidth),
            ivPicture.heightAnchor.constraint(equalToConstant: Constant.bookImgHeight),
            ivPicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),

            lbTitle.topAnchor.constraint(equalTo: self.topAnchor),
            lbTitle.leadingAnchor.constraint(equalTo: ivPicture.trailingAnchor, constant: 8),
            lbTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),

            lbAuthor.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 8),
            lbAuthor.leadingAnchor.constraint(equalTo: ivPicture.trailingAnchor, constant: 8),
            lbAuthor.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),

            lbKind.topAnchor.constraint(equalTo: lbAuthor.bottomAnchor, constant: 8),
            lbKind.leadingAnchor.constraint(equalTo: ivPicture.trailingAnchor, constant: 8),
            lbKind.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            lbKind.heightAnchor.constraint(equalToConstant: 17),

            lbDescription.topAnchor.constraint(equalTo: ivPicture.bottomAnchor, constant: 25),
            lbDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            lbDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            lbDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25)
        ])
        customSetup()
    }

    func customSetup() {
        self.backgroundColor = .none

        lbTitle.numberOfLines = 0
        lbKind.numberOfLines = 0
        lbDescription.numberOfLines = 0
    }
}
