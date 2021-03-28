//
//  URLSessionDataTaskMock.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

class URLSessionDataTaskMock: URLSessionDataTaskProtocol {

    private (set) var resumeWasCalled = false

    func resume() {
        resumeWasCalled = true
    }
}
