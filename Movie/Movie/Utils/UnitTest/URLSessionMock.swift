//
//  URLSessionMock.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

class URLSessionMock: URLSessionProtocol {

    var nextDataTask = URLSessionDataTaskMock()
    var nextData: Data?
    var nextResponse: URLResponse?
    var nextError: Error?

    private (set) var lastURL: URL?

    func dataTask(with request: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = request
        completionHandler(nextData, nextResponse, nextError)
        return nextDataTask
    }
}
