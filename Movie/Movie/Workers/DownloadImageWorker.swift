//
//  DownloadImageWorker.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

class DownloadImageWorker {

    let moviesURLWorker = MoviesURLWorker()
    let setupRequestWorkerObj = SetupRequestWorker()

    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func getImage(_ movieModel: MovieModel, completion: @escaping (Bool, Data?) -> Void) {
        let gerImageUrl = moviesURLWorker.getImageURL() + movieModel.posterPath

        let request = setupRequestWorkerObj.setupGetRequest(mainUrl: gerImageUrl)
        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            self.responseCompletionImage(response, data, error, completion: completion)
        }).resume()
    }

    fileprivate func responseCompletionImage(_ response: URLResponse?,
                                             _ data: Data?,
                                             _ error: Error?,
                                             completion: @escaping (Bool, Data?) -> Void) {
        DispatchQueue.main.async {
            let httpStatus = response as? HTTPURLResponse
            if httpStatus?.statusCode == 200 {
                completion(true, data)
            } else {
                NSLog("\(httpStatus?.statusCode ?? 400)")
                NSLog("\(httpStatus?.description ?? "Error getImage Function")")
                completion(false, nil)
            }
        }
    }
}
