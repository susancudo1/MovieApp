//
//  MoviesURLWorker.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

class MoviesURLWorker {

    // MARK: Variable name for the main API IMAGE URL
    private let apiImageUrlMovies = "API_IMAGE_URL"

    // MARK: Subdomain for image original endpoint
    private let imageOriginalSubdomain = "original"

    func getImageURL() -> String {
        return getVariableFromPlist(variableName: apiImageUrlMovies) + imageOriginalSubdomain
    }

    // MARK: Function used to get the main backend URL from xcconfig file
    private func getVariableFromPlist(variableName: String) -> String {
        return ((Bundle.main.infoDictionary?[variableName] as? String)?.replacingOccurrences(of: "\\", with: ""))!
    }
}
