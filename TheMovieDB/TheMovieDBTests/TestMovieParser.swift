//
//  MovieParserTest.swift
//  TheMovieDBTests
//
//  Created by Mariana Andrea Orman Berch on 7/10/21.
//

import XCTest
@testable import TheMovieDB

class TestMovieParser: XCTestCase {

    func testMovieParser() throws {

        guard let filePath = Bundle(for: Self.self).path(forResource: "MoviesData", ofType: "json")
        else {
            print("Error opening the file")
            return
        }
        let fileUrl = URL(fileURLWithPath: filePath)
        guard let data = try? Data(contentsOf: fileUrl) else {
            XCTFail("Error from file")
            return
        }

        let movies = MovieParser().parser(jsonData: data)

        XCTAssertEqual(movies[0].title, "Dilwale Dulhania Le Jayenge")

        XCTAssertEqual(movies.count, 20)

        XCTAssertEqual(movies[2].originalLanguage, "en")
    }
}
