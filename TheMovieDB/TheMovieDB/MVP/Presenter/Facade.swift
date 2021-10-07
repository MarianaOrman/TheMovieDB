//
//  Facade.swift
//  TheMovieDB
//
//  Created by Mariana Andrea Orman Berch on 4/10/21.
//

import Foundation
import UIKit

class Facade {
    
    static let facadeSingleton = Facade()
        
    let networkProvider = NetworkProvider()
    
    func facadeGetMovies(completion: @escaping ([Movie]) -> Void) {
        networkProvider.getMovies(completion: completion)
    }
    
    func facadeGetImage(url: String, completion: @escaping (UIImage?) -> Void) {
        networkProvider.getImage(url: url, completion: completion)
    }
}
