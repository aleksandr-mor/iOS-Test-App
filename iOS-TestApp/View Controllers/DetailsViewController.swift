//
//  MovieDetailsVC.swift
//  iOS-TestApp
//
//  Created by Aleksandr Morozov on 16.04.2022.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailsViewController: UIViewController {
    
    // MARK: - Variables and Constants
    var movie : Movie?
    let imageBaseUrl =  "https://image.tmdb.org/t/p/w500"
    
    // MARK: - Outlets
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var DescriptionTextField: UITextView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
// MARK: - SetupUI
extension DetailsViewController {
    
    func setupUI() {
        if let movie = movie {
            movieTitleLabel.text = movie.original_title
            DescriptionTextField.text = movie.overview
            let url = URL(string: imageBaseUrl + movie.poster_path)!
            moviePosterImage.af.setImage(withURL: url , placeholderImage: UIImage(named: "placeholder"), imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: true, completion: nil)
        } else {
            print("error")
        }
    }
}

