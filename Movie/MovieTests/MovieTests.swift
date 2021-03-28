//
//  MovieTests.swift
//  MovieTests
//
//  Created by Javier Susa on 27/03/21.
//

import XCTest
@testable import Movie

class MovieTests: XCTestCase {

    let mockResultModel = """
    {
       "page":1,
       "results":[
          {
             "adult":false,
             "backdrop_path":"/pcDc2WJAYGJTTvRSEIpRZwM3Ola.jpg",
             "genre_ids":[
                28,
                12,
                14,
                878
             ],
             "id":791373,
             "original_language":"en",
             "original_title":"Zack Snyder's Justice League",
             "overview":"Determined to ensure Superman's ultimate sacrifice was not in vain.",
             "popularity":10979.724,
             "poster_path":"/tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg",
             "release_date":"2021-03-18",
             "title":"Zack Snyder's Justice League",
             "video":false,
             "vote_average":8.7,
             "vote_count":3648
          }
       ],
       "total_pages":500,
       "total_results":10000
    }
    """

    func test01DownloadListCatsSuccess() {
        let session = URLSessionMock()
        let worker = MovieListWorker(session: session)

        let data = Data(self.mockResultModel.utf8)
        session.nextData = data
        let url = URL(string: worker.moviesURLWorker.getListPopularityURL())
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: ResultModel?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getSearch { (success, resultModel) in
            successResponse = success
            response = resultModel
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertTrue(successResponse!)
        XCTAssertEqual(response?.results.first?.iden, 791373)
    }

    func test02DownloadListCatsError() {
        let session = URLSessionMock()
        let worker = MovieListWorker(session: session)

        let url = URL(string: worker.moviesURLWorker.getListPopularityURL())
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 400, httpVersion: "2.0", headerFields: nil)
        let data = Data(self.mockResultModel.utf8)
        session.nextData = data

        // Perform the request and verify the result
        var successResponse: Bool?
        var response: ResultModel?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getSearch { (success, resultModel) in
            successResponse = success
            response = resultModel
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10)

        XCTAssertFalse(successResponse!)
        XCTAssertNil(response)
    }

    func test03SuccessDownloadImage() {
        let session = URLSessionMock()
        let worker = DownloadImageWorker()

        let mockResultModelData = Data(self.mockResultModel.utf8)
        var resultModel: ResultModel?
        do {
            let decoder = JSONDecoder()
            resultModel = try decoder.decode(ResultModel.self, from: mockResultModelData)
        } catch {

        }
        let url = URL(string: (resultModel?.results.first?.posterPath)!)
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: Data?
        let exp = self.expectation(description: "Waiting for blocking")
        worker.getImage((resultModel?.results.first)!) { (success, imageData) in
            successResponse = success
            response = imageData
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10)

        XCTAssertTrue(successResponse!)
        XCTAssertNotNil(response)
    }

    func test04FailDownloadImage() {
        let session = URLSessionMock()
        let worker = DownloadImageWorker()

        let mockResultModelData = Data(self.mockResultModel.utf8)
        var resultModel: ResultModel?
        do {
            let decoder = JSONDecoder()
            resultModel = try decoder.decode(ResultModel.self, from: mockResultModelData)
        } catch {

        }
        resultModel?.results[0].posterPath = "https://www.google.com/"
        let url = URL(string: "https://www.google.com/")
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 400, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: Data?
        let exp = self.expectation(description: "Waiting for blocking")
        worker.getImage((resultModel?.results.first)!) { (success, imageData) in
            successResponse = success
            response = imageData
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10)

        XCTAssertFalse(successResponse!)
        XCTAssertNil(response)
    }

    func test05Localized() {
        let string = "title_app".localized
        XCTAssertEqual(string, "Movies")
    }

}
