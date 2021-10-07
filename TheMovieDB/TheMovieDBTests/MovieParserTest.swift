//
//  MovieParserTest.swift
//  TheMovieDBTests
//
//  Created by Mariana Andrea Orman Berch on 7/10/21.
//

import XCTest
@testable import TheMovieDB

class MovieParserTest: XCTestCase {

    func movieParserTest() throws {

        let fileUrl = URL(fileURLWithPath: "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1")
        guard let data = try? Data(contentsOf: fileUrl) else {
            XCTFail("Error from file")
            return
        }

        let movies = MovieParser().movieParser(jsonData: data)

        XCTAssertEqual(movies[0].title, "Dilwale Dulhania Le Jayenge")

        XCTAssertEqual(movies.count, 20)

        XCTAssertEqual(movies[2].originalLanguage, "en")
    }
}
