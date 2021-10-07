//
//  GetData.swift
//  TheMovieDB
//
//  Created by Mariana Andrea Orman Berch on 21/9/21.
//

import Foundation
import UIKit

class NetworkProvider {

    var movieParser = MovieParser()
    
    enum baseUrls: String {
        case movieBaseUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1"
        case imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    }
    
    public func getMovies(completion: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: baseUrls.movieBaseUrl.rawValue) else {
            completion([])
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion([])
                return
            }
            
            let returnedData = self.movieParser.movieParser(jsonData: data)
            completion(returnedData)
        }
        task.resume()
    }
    
    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let imageURL = URL(string: "\(baseUrls.imageBaseUrl.rawValue)\(url)") else { return }
        
        // So we don't cause a deadlock in the UI:
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            let image = UIImage(data: imageData)
            
            completion(image)
        }
    }
}
