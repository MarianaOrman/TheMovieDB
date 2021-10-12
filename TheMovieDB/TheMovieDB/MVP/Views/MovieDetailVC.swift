//
//  MovieDetailVC.swift
//  TheMovieDB
//
//  Created by Mariana Andrea Orman Berch on 22/9/21.
//

import UIKit

class MovieDetailVC: UIViewController {

    var movie: Movie
    var movieImageView = UIImageView()
    var movieNameLabel = UILabel()
    var languageLabel = UILabel()
    var overviewLabel = UILabel()
    var ratingLabel = UILabel()
    
    init (movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    func setMovieData() {
        
        Facade.shared.getImage(url:movie.imagePath ?? "", completion: { [weak self] result in
                        
            DispatchQueue.main.async {
                self?.movieImageView.image = result
            }
        })
        movieNameLabel.text = movie.title
        languageLabel.text = "Language: \(movie.originalLanguage?.uppercased() ?? "")"
        overviewLabel.text = movie.overview
        ratingLabel.text = "Rating: \(movie.rating ?? 0)"
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMovieData()
        
        view.addSubview(movieImageView)
        view.addSubview(movieNameLabel)
        view.addSubview(languageLabel)
        view.addSubview(overviewLabel)
        view.addSubview(ratingLabel)
        
        setMovieImageImageViewFrames()
        setMovieNameLabelFrame()
        setLanguageLabelFrame()
        setOverviewLabelFrame()
        setRatingLabelFrame()
    }
    
    func setMovieImageImageViewFrames() {
                    
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(0)).isActive = true
        movieImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(80)).isActive = true
        movieImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(0)).isActive = true
        movieImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/16).isActive = true
    }
    
    func setMovieNameLabelFrame() {
        
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        movieNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        movieNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        movieNameLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 30).isActive = true
        movieNameLabel.textColor = UIColor.white
        movieNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func setLanguageLabelFrame() {
        
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        languageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        languageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        languageLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 30).isActive = true
        languageLabel.textColor = UIColor.white
        languageLabel.font = UIFont.boldSystemFont(ofSize: 13)
    }
    
    func setOverviewLabelFrame() {
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        overviewLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        overviewLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 30).isActive = true
        overviewLabel.textColor = UIColor.white
        overviewLabel.font = UIFont.boldSystemFont(ofSize: 15)
        overviewLabel.numberOfLines = 0
        overviewLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        overviewLabel.sizeToFit()
    }
    
    func setRatingLabelFrame() {
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        ratingLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 30).isActive = true
        ratingLabel.textColor = UIColor.yellow
        ratingLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
}
