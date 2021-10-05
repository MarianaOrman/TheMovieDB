//
//  MovieDataStruct.swift
//  TheMovieDB
//
//  Created by Mariana Andrea Orman Berch on 21/9/21.
//

import Foundation

struct Movie: Decodable {
    private enum CodingKeys: String, CodingKey {
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case imagePath = "backdrop_path"
        case rating = "vote_average"
        case title = "title"
        case overview = "overview"
    }
    var overview: String?
    var releaseDate: String?
    var originalLanguage: String?
    var title: String?
    var imagePath: String?
    var rating: Double?
}

struct MoviesGroup: Decodable {
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    var movies: [Movie]
}
