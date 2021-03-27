//
//  ResultModel.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

struct ResultModel: Codable {
    var page: Int
    var results: [MovieModel]
    var totalPages: Int
    var totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
