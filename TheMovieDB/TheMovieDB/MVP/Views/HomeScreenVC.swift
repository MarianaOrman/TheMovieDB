//
//  HomeScreenVC.swift
//  TheMovieDB
//
//  Created by Mariana Andrea Orman Berch on 21/9/21.
//

import Foundation
import UIKit

class HomeScreenVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
    var movies: [Movie] = []
                
    let deviceIdiom = UIDevice.current.userInterfaceIdiom
        
    lazy var collectionView: UICollectionView = UICollectionView()
    
    enum identifiers: String {
        case movieCollectionViewCell = "movieCollectionViewCell"
        case movieTableViewCell = "MovieCell"
    }
    
    private func setUpMovieCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4, height: (view.frame.size.height/3)-4)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: identifiers.movieCollectionViewCell.rawValue)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        setCollectionViewFrames()
    }
    
    func setCollectionViewFrames() {
                    
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(0)).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(170)).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(0)).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMovieCollectionView()
        
        switch deviceIdiom {
        case .pad:
            tableView.isHidden = true
            collectionView.isHidden = false
        default:
            tableView.isHidden = false
            collectionView.isHidden = true
        }
        
        Facade.facadeSingleton.facadeGetMovies(completion: { [weak self] result in
            
            self?.movies = result
            
            DispatchQueue.main.async { [weak self] in
                switch self?.deviceIdiom {
                case .pad:
                    self?.collectionView.reloadData()
                default:
                    self?.tableView.reloadData()
                }
            }
        })
    }
}

extension HomeScreenVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movies[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifiers.movieCollectionViewCell.rawValue, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setMovieCell(movie: movie)
        return cell
    }
}


extension HomeScreenVC: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var movie: Movie
        movie = movies[indexPath.row]
        let movieDetailVC = MovieDetailVC(movie: movie)
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}


extension HomeScreenVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifiers.movieTableViewCell.rawValue, for: indexPath) as? MovieTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.setMovieCell(movie: movie)
        
        return cell
    }
}

extension HomeScreenVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var movie: Movie
        movie = movies[indexPath.row]
        let movieDetailVC = MovieDetailVC(movie: movie)
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

