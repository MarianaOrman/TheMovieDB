//
//  Facade.swift
//  TheMovieDB
//
//  Created by Mariana Andrea Orman Berch on 4/10/21.
//

import UIKit

class Facade {
    
    static let shared = Facade()
        
    let networkProvider = NetworkProvider()
    
    func getMovies(completion: @escaping ([Movie]) -> Void) {
        networkProvider.getMovies(completion: completion)
    }
    
    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        networkProvider.getImage(url: url, completion: completion)
    }
}
