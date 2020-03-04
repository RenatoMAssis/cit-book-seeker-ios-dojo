//
//  ScrollViewExtension.swift
//  BookSearch
//
//  Created by Pericles Junor on 02/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

extension UIScrollView {

    func resizeScrollViewContentSize() {

        var contentSizeRect = CGRect.zero

        for subview in self.subviews {
            contentSizeRect = contentSizeRect.union(subview.frame)
        }

        self.contentSize = contentSizeRect.size
    }
}
