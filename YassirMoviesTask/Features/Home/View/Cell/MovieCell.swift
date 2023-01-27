//
//  MovieCell.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//
import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func setup(movie: Movie?) {
        titleLabel.text = movie?.title
        dateLabel.text = L10n.Movie.releaseDate(movie?.releaseDate ?? "")
        overviewLabel.text = movie?.overview
        movieImageView.loadImageFromUrl(urlString: movie?.posterFullPath ?? "",
                                        placeHolderImage: Asset.Images.icNoData.image)
    }
    
}
