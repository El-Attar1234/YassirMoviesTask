//
//  MovieDetailsVC.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 27/01/2023.
//

import UIKit

class MovieDetailsVC: BaseViewController {
    @IBOutlet private weak var movieImage: UIImageView!
    
    private var presenter: MovieDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getMovieDetails()
        // Do any additional setup after loading the view.
    }
    // MARK: - Custom Setter
    public func setPresenter (presenter: MovieDetailsPresenterProtocol) {
        self.presenter = presenter
    }

}

extension MovieDetailsVC: MovieDetailsViewProtocol {
    func fetchedData(movie: MovieDetails?) {
        movieImage.loadImageFromUrl(urlString: movie?.posterFullPath ?? "",
                                    placeHolderImage: Asset.Images.icNoData.image)
    }
    
}
