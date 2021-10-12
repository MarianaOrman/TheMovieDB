//
//  NetworkProviderTests.swift
//  TheMovieDBTests
//
//  Created by Mariana Andrea Orman Berch on 7/10/21.
//

import XCTest
@testable import TheMovieDB

class TestsNetworkProvider: XCTestCase {
                
    func testGetMovies() throws {
        
        let expect = expectation(description: "Download should have succeded.")
                
        Facade.shared.getMovies(completion: { result in
            
            XCTAssertNotNil(result)
            XCTAssertEqual(result[0].title, "Dilwale Dulhania Le Jayenge")
            XCTAssertEqual(result[3].originalLanguage, "en")
            
            expect.fulfill()
        })
        waitForExpectations(timeout: 5) { (error) in XCTAssertNil(error, "Test timed out")}
    }
    
    func TestGetImage() throws {
        
        let expect = expectation(description: "Download should have succeded.")
        
        Facade.shared.getImage(url: "/5hNcsnMkwU2LknLoru73c76el3z.jpg", completion: {result in
            
            XCTAssertNotNil(result)
            
            expect.fulfill()
        })
        waitForExpectations(timeout: 5) { (error) in XCTAssertNil(error, "Test timed out")}
    }
}
