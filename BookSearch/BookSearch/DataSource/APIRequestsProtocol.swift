//
//  APIRequestsProtocol.swift
//  BookSearch
//
//  Created by Pericles Junor on 01/03/20.
//  Copyright © 2020 Pericles Jr. All rights reserved.
//

import UIKit

protocol APIRequestsProtocol {
    func searchBook(term: String, completion: @escaping (_ success: [[String: Any]]?, _ error: Error?) -> Void)
}
