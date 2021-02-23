//
//  Movie.swift
//  Flix
//
//  Created by Mikayla Orange on 2/16/21.
//

import Foundation
class Movie {
    var posterUrl: URL?
    var backdropUrl: URL?
    var title: String
    var releaseDate: String
    var overView: String

    
    init(dict: [String: Any]) {
        posterUrl = URL(string: ("https://image.tmdb.org/t/p/w500" + (dict["poster_path"]as! String)))
        backdropUrl = URL(string: ("https://image.tmdb.org/t/p/w500" + (dict["backdrop_path"]as! String)))
        title = dict["original_title"] as! String
        releaseDate = dict["release_date"] as! String
        overView = dict["overview"] as! String
        
    }
}
