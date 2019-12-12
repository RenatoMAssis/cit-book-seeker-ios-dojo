//
//  ListBooksViewCell.swift
//  cit-book-seeker-ios-dojo
//
//  Created by Zied on 11/12/19.
//  Copyright © 2019 ioasys. All rights reserved.
//

import UIKit
import SDWebImage

public class ListBooksViewCell: UITableViewCell {

    //MARK: - Outlets
    private lazy var bookCoverImage: UIImageView = {
        let bookCoverImage = UIImageView(frame: .zero)
        bookCoverImage.translatesAutoresizingMaskIntoConstraints = false
        bookCoverImage.contentMode = .scaleAspectFit
        return bookCoverImage
    }()
    
    private lazy var titleBook:UILabel = {
        let titleBook = UILabel(frame: .zero)
        titleBook.translatesAutoresizingMaskIntoConstraints = false
        titleBook.textAlignment = .left
        titleBook.font = UIFont(name: "FontAwesome", size: 16)
        titleBook.textColor = .black
        titleBook.numberOfLines = 0
        return titleBook
    }()
    
    //MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraintUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - ConstraintLayout
    private func constraintUI(){
        
        contentView.addSubview(bookCoverImage)
        contentView.addSubview(titleBook)
        
        NSLayoutConstraint.activate([
        
            bookCoverImage.widthAnchor.constraint(equalToConstant: 50),
            bookCoverImage.heightAnchor.constraint(equalToConstant: 80),
            bookCoverImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bookCoverImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            titleBook.leadingAnchor.constraint(equalTo: bookCoverImage.trailingAnchor, constant: 16),
            titleBook.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleBook.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            titleBook.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
        ])
    }
    
    //MARK: Configuration
    
    public func configure(book: BookModel){
        titleBook.text = book.trackName ?? ""
        let url = URL(string: book.artworkUrl100 ?? "")
        bookCoverImage.sd_setImage(with: url, placeholderImage: UIImage(named: "book"), options: [.allowInvalidSSLCertificates, .retryFailed, .continueInBackground, .progressiveLoad])
    }
    
}
