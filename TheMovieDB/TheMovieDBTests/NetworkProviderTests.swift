//
//  NetworkProviderTests.swift
//  TheMovieDBTests
//
//  Created by Mariana Andrea Orman Berch on 7/10/21.
//

import XCTest
@testable import TheMovieDB

class NetworkProviderTests: XCTestCase {
    
    var movies: [Movie] = []
    
    var imageView: UIImageView = UIImageView()
    
    func getMoviesTest() throws {
        
        NetworkProvider().getMovies(completion: { [weak self] result in
            
            self?.movies = result
        })
        
        XCTAssertEqual(movies[0].title, "Dilwale Dulhania Le Jayenge")
        XCTAssertEqual(movies.count, 20)
        XCTAssertEqual(movies[2].originalLanguage, "en")
    }
    
    func getImageTest() throws {
        
        let urlOne = URL(string:"https://image.tmdb.org/t/p/w500/5hNcsnMkwU2LknLoru73c76el3z.jpg")
        let dataOne = try! Data(contentsOf: urlOne!)
        let imageOne: UIImage = UIImage(data: dataOne) ?? UIImage(imageLiteralResourceName: "house")
        
        NetworkProvider().getImage(url: movies[0].imagePath ?? "", completion: { [weak self] resultOne in
            
            DispatchQueue.main.async {
                self?.imageView.image = resultOne
            }
            XCTAssertEqual(resultOne, imageOne)
        })
        
        let urlTwo = URL(string:"https://image.tmdb.org/t/p/w500/jtAI6OJIWLWiRItNSZoWjrsUtmi.jpg")
        let dataTwo = try! Data(contentsOf: urlTwo!)
        let imageTwo: UIImage = UIImage(data: dataTwo) ?? UIImage(imageLiteralResourceName: "house")
        
        NetworkProvider().getImage(url: movies[3].imagePath ?? "", completion: { [weak self] resultTwo in
            
            DispatchQueue.main.async {
                self?.imageView.image = resultTwo
            }
            XCTAssertEqual(resultTwo, imageTwo)
        })
    }
}
