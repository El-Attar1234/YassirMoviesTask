//
//  MovieCell.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//
import UIKit
import Hero

class MovieCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // movieImageView.hero.id = "ttt"
        // Initialization code
    }

    func setup(movie: Movie?) {
        titleLabel.text = movie?.title
        dateLabel.text = movie?.releaseDate
        overviewLabel.text = movie?.overview
        movieImageView.hero.id = "\(movie?.id ?? 0)"
        movieImageView.loadImageFromUrl(urlString: movie?.posterFullPath ?? "",
                                        placeHolderImage: Asset.Images.icNoData.image)
    }
    
}
