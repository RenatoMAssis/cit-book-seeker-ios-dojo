//
//  DetailsWebViewController.swift
//  cit-book-seeker-ios-dojo
//
//  Created by Zied on 12/12/19.
//  Copyright © 2019 ioasys. All rights reserved.
//

import UIKit
import WebKit
import AVKit

public class DetailsWebViewController: UIViewController {
    
    //MARK: - Properties
    
    public var book: BookModel? {
        didSet{
            guard let url = URL(string: book?.trackViewUrl ?? "") else { return }
            webView.load(URLRequest(url: url))
        }
    }
    
    //MARK: - Outlets
    
    public lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.allowsPictureInPictureMediaPlayback = true
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.bounces = false
        webView.scrollView.isScrollEnabled = true

        return webView
    }()
    
    //MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        constraintUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    //MARK: - Constraint layouts
    
    private func constraintUI() {
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }

}
