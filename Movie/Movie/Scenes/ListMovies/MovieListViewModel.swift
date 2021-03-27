//
//  MovieListViewModel.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

class MovieListViewModel {

    var movieListWorker = MovieListWorker()
    var downloadImageWorker = DownloadImageWorker()

    func search(completion: @escaping (ResultModel?) -> Void) {
        // Busca el producto en el servicio expuesto
        self.movieListWorker.getSearch { (success, moviesModel) in
            if success {

                guard (moviesModel?.results.count ?? 0) > 0 else {
                    completion(nil)
                    return
                }
                if var newMoviesModel = moviesModel {
                    // Por cada producto encontrado se busca su imagen
                    for index in 0...newMoviesModel.results.count - 1 {
                        self.downloadImageWorker.getImage(newMoviesModel.results[index]) { (success, imageData) in
                            if success {
                                newMoviesModel.results[index].imageData = imageData

                            }
                            completion(newMoviesModel)
                        }
                    }

                }
            } else {
                completion(moviesModel)
            }
        }
    }
}
