//
//  MovieModel.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

struct MovieModel: Codable {
    var adult: Bool
    var backdropPath: String
    var genreIds: [Int]
    var iden: Int
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var releaseDate: String
    var title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int
    var imageData: Data?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case iden = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case imageData
    }
}
