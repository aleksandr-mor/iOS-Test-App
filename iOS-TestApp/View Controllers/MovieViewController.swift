//
//  MainViewController.swift
//  iOS-TestApp
//
//  Created by Lukas Brüggemann on 14.07.21.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieViewController: UIViewController  {
    
    // MARK: - Variables and Constants
    var movies : [Movie] = []
    let apiKey = "YOUR API"
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchData(movieName: "Spider-Man")
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MovieViewController : UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieViewCell", for: indexPath) as? MovieViewCell else { return UITableViewCell() }
        
        let movie = movies[indexPath.row]
        let imageBaseUrl =  "https://image.tmdb.org/t/p/w500"
        let url = URL(string: imageBaseUrl + movie.poster_path)!
        
        cell.labelTitle?.text = movie.title
        cell.labelLanguage?.text = movie.original_language
        cell.imageViewPoster?.af.setImage(withURL: url , placeholderImage: UIImage(named: "placeholder"), imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: true, completion: nil)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
        vc.movie = movies[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

//MARK: - API
extension MovieViewController {
    
    func fetchData(movieName: String) {
        AF.request("https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(movieName)&page=1&include_adult=true").responseDecodable(of: Movies.self) { response in
            if let error = response.error {
                print("An error occurred: \(error.localizedDescription)")
            } else {
                if let movie = response.value {
                    self.movies = movie.results
                    self.tableView.reloadData()
                }
            }
        }
    }
}
