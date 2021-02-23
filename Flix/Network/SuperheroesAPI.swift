//
//  SuperheroesAPI.swift
//  Flix
//
//  Created by Mikayla Orange on 2/22/21.
//

import Foundation
import UIKit

struct SuperheroAPI {
    static func getAPI(completion: @escaping ([Movie]?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                // TODO: Get the array of movies
                let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                var movies: [Movie] = []
                for dictionary in movieDictionaries {
                    let movie = Movie.init(dict: dictionary)
                    print(dictionary)
                    movies.append(movie)
                }
                return completion(movies)
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()
    }
}
