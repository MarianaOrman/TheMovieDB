//
//  NetworkProviderTests.swift
//  TheMovieDBTests
//
//  Created by Mariana Andrea Orman Berch on 7/10/21.
//

import XCTest
@testable import TheMovieDB

class TestsNetworkProvider: XCTestCase {
    
    var movies: [Movie] = []
    
    var imageView: UIImageView = UIImageView()
    
    let networkProvider = NetworkProvider()
    
    func testGetMovies() throws {
        
        networkProvider.getMovies(completion: { [weak self] result in
            
            self?.movies = result
        })
        
        XCTAssertNotNil(movies)
    }
    
    func TestGetImage() throws {
        
        networkProvider.getImage(url: movies[0].imagePath ?? "", completion: { [weak self] resultOne in
            
            DispatchQueue.main.async {
                self?.imageView.image = resultOne
            }
            XCTAssertNotNil(resultOne)
        })
        
        networkProvider.getImage(url: movies[3].imagePath ?? "", completion: { [weak self] resultTwo in
            
            DispatchQueue.main.async {
                self?.imageView.image = resultTwo
            }
            XCTAssertNotNil(resultTwo)
        })
    }
}
