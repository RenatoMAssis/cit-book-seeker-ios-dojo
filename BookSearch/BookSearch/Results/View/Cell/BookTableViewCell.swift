//
//  BookTableViewCell.swift
//  BookSearch
//
//  Created by Pericles Junor on 01/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell, BaseViewProtocol {

    public lazy var lbTitle: UILabel! = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .left
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
            ivPicture.heightAnchor.constraint(equalToConstant: 100),
            ivPicture.widthAnchor.constraint(equalToConstant: 70),
            ivPicture.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),

            lbTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            lbTitle.leadingAnchor.constraint(equalTo: ivPicture.trailingAnchor, constant: 8),
            lbTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            lbTitle.heightAnchor.constraint(equalToConstant: 16)
        ])
        customSetup()
    }

    func customSetup() {
//        self.bac
    }
}
