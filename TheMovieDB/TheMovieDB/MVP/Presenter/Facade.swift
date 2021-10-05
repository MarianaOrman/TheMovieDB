//
//  Facade.swift
//  TheMovieDB
//
//  Created by Mariana Andrea Orman Berch on 4/10/21.
//

import Foundation
import UIKit

class Facade {
    
    let networkProvider = NetworkProvider()
    
    func facadeGetMovies (completion: @escaping ([Movie]) -> Void) {
        networkProvider.getMovies(completion: completion)
    }
    
    func facadeGetImageData (url: String, completion: @escaping (UIImage?) -> Void) {
        networkProvider.getImageData(url: url, completion: completion)
    }
}
