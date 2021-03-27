//
//  MoviesURLWorker.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

class MoviesURLWorker {

    // MARK: Variable name for the main API URL
    private let apiUrlMovies = "API_MAIN_URL"

    // MARK: Variable name for the main API Key
    private let apiKeyMovies = "API_KEY"

    // MARK: Variable name for the main API IMAGE URL
    private let apiImageUrlMovies = "API_IMAGE_URL"

    // MARK: Subdomain for movie list endpoint
    private let movieListSubdomain = "discover/movie?sort_by=popularity.desc&api_key="

    // MARK: Subdomain for image original endpoint
    private let imageOriginalSubdomain = "original"

    // MARK: Gets the full endpoint for Block user function
    func getListPopularityURL() -> String {
        return getVariableFromPlist(variableName: apiUrlMovies) +
            movieListSubdomain +
            getVariableFromPlist(variableName: apiKeyMovies)
    }

    func getImageURL() -> String {
        return getVariableFromPlist(variableName: apiImageUrlMovies) + imageOriginalSubdomain
    }

    // MARK: Function used to get the main backend URL from xcconfig file
    private func getVariableFromPlist(variableName: String) -> String {
        return ((Bundle.main.infoDictionary?[variableName] as? String)?.replacingOccurrences(of: "\\", with: ""))!
    }
}
