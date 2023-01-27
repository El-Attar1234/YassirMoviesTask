//
//  MovieDetailsVC.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 27/01/2023.
//

import UIKit

class MovieDetailsVC: BaseViewController {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var voteLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var popularityLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    
    private var presenter: MovieDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getMovieDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    // MARK: - Custom Setter
    public func setPresenter (presenter: MovieDetailsPresenterProtocol) {
        self.presenter = presenter
    }

}

extension MovieDetailsVC: MovieDetailsViewProtocol {
    func fetchedData(movie: MovieDetails?) {
        movieTitleLabel.text = movie?.title
        voteLabel.text = L10n.Movie.totalVotes(movie?.voteCount ?? 0, movie?.voteAverage?.description ?? "0")
        popularityLabel.text = L10n.Movie.popularity(movie?.popularity ?? 0)
        releaseDateLabel.text = L10n.Movie.releaseDate(movie?.releaseDate ?? "-")
        overviewLabel.text = movie?.overview
        movieImage.loadImageFromUrl(urlString: movie?.posterFullPath ?? "",
                                    placeHolderImage: Asset.Images.icNoData.image)
        
    }
    
}
