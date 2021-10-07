//
//  MovieCell.swift
//  TheMovieDB
//
//  Created by Mariana Andrea Orman Berch on 21/9/21.
//

import Foundation
import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCellImageView: UIImageView!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var movieNameLabel: UILabel!
        
    func setMovieCell (movie: Movie) {
            
        Facade.facadeSingleton.facadeGetImage(url:movie.imagePath ?? "", completion: { [weak self] result in
                        
            DispatchQueue.main.async {
                self?.imageCellImageView.image = result
            }
        })
                
        movieNameLabel.text = movie.title
        languageLabel.text = "Language: \(movie.originalLanguage?.uppercased() ?? "")"
        ratingLabel.text = "Rating: \(movie.rating ?? 0)"
    }
}
