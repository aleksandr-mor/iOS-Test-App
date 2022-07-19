//
//  MovieViewCell.swift
//  iOS-TestApp
//
//  Created by Aleksandr Morozov on 21.04.2022.
//

import UIKit

class MovieViewCell: UITableViewCell {
   
    // MARK: - Outlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelLanguage: UILabel!
    @IBOutlet weak var imageViewPoster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
