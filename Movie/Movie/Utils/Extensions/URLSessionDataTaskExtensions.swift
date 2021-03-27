//
//  URLSessionDataTaskExtensions.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {
}
