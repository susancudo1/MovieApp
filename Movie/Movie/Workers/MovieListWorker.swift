//
//  MovieListWorker.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

class MovieListWorker {

    let moviesURLWorker = MoviesURLWorker()
    let setupRequestWorkerObj = SetupRequestWorker()

    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func getSearch(completion: @escaping (Bool, ResultModel?) -> Void) {
        let getGetProductsSearchUrl = self.moviesURLWorker.getListPopularityURL()
        let request = setupRequestWorkerObj.setupGetRequest(mainUrl: getGetProductsSearchUrl)

        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            self.responseCompletion(response, data, error, completion: completion)
        }).resume()
    }

    fileprivate func responseCompletion(_ response: URLResponse?,
                                        _ data: Data?,
                                        _ error: Error?,
                                        completion: @escaping (Bool, ResultModel?) -> Void) {
        DispatchQueue.main.async {
            do {
                let httpStatus = response as? HTTPURLResponse
                if httpStatus?.statusCode == 200 {
                    let decoder = JSONDecoder()
                    let queryResultModel = try decoder.decode(ResultModel.self, from: data!)
                    completion(true, queryResultModel)
                } else {
                    NSLog("\(httpStatus?.statusCode ?? 400)")
                    NSLog("\(httpStatus?.description ?? "Error getSearch function")")
                    completion(false, nil)
                }
            } catch {
                NSLog(error.localizedDescription)
                completion(false, nil)
            }
        }
    }
}
