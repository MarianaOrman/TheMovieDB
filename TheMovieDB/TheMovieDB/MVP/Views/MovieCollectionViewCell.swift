//
//  CollectionCell.swift
//  TheMovieDB
//
//  Created by Mariana Andrea Orman Berch on 28/9/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "movieCollectionViewCell"
    
    var imageCellImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "house")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    var movieNameLabel: UILabel = {
        let name = UILabel()
        name.text = "name"
        name.textColor = UIColor.white
        return name
    }()
    
    var languageLabel: UILabel = {
        let language = UILabel()
        language.text = "language"
        language.textColor = UIColor.white
        return language
    }()
    
    var ratingLabel: UILabel = {
        let rating = UILabel()
        rating.text = "rating"
        rating.textColor = UIColor.yellow
        return rating
    }()
    
    func setUpViews () {
        contentView.addSubview(imageCellImageView)
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(languageLabel)
        contentView.addSubview(ratingLabel)
        contentView.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        func setImageCellImageViewFrame () {
                        
            imageCellImageView.translatesAutoresizingMaskIntoConstraints = false
            imageCellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(0)).isActive = true
            imageCellImageView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(0)).isActive = true
            imageCellImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(0)).isActive = true
            imageCellImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        }
        setImageCellImageViewFrame()

        
        func setMovieNameLabelFrame () {
            
            movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
            movieNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
            movieNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 1/2+5).isActive = true
            movieNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
            movieNameLabel.heightAnchor.constraint(equalTo: heightAnchor, constant: 0).isActive = true
        }
        setMovieNameLabelFrame ()
        
        
        func setLanguageLabelFrame () {
            
            languageLabel.translatesAutoresizingMaskIntoConstraints = false
            languageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
            languageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 35).isActive = true
            languageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5).isActive = true
            languageLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        }
        setLanguageLabelFrame ()
        
        
        func setRatingLabelFrame () {
            
            ratingLabel.translatesAutoresizingMaskIntoConstraints = false
            ratingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
            ratingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5).isActive = true
            ratingLabel.heightAnchor.constraint(equalTo: heightAnchor, constant: 1).isActive = true
        }
        setRatingLabelFrame ()
    }
    
    var movies: [Movie] = HomeScreenVC().movies
    
    func setImage(from url: String) {
        
        guard let imageURL = URL(string: url) else { return }
        
        // So we don't cause a deadlock in the UI:
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.imageCellImageView.image = image
            }
        }
    }
    
    
    func setMovieCell (movie: Movie) {
        
        let facade = Facade()
        
        facade.networkProvider.getImageData(url:movie.imagePath ?? "", completion: { [weak self] result in
                    
            DispatchQueue.main.async {
                self?.imageCellImageView.image = result
            }
        })
        
        
        movieNameLabel.text = movie.title
        movieNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        languageLabel.text = "Language: \(movie.originalLanguage?.uppercased() ?? "")"
        ratingLabel.text = "Rating: \(movie.rating ?? 0)"
        ratingLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
    }
}

