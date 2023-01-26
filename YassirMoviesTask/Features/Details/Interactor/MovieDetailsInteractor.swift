//
//  MovieDetailsInteractor.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 27/01/2023.
//

import Foundation
class MovieDetailsInteractor {
    
    private weak var remoteDataSource: NetworkManagerProtocol!
    private weak var presenter: MovieDetailsInteractorOutputProtocol?
    
    init(remoteDataSource: NetworkManagerProtocol = DataSource.provideNetworkDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    // MARK: - Custom Setter
    public func setPresenter (presenter: MovieDetailsInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

// MARK: - Remote Fetching
extension MovieDetailsInteractor: MovieDetailsInteractorInputProtocol {
    func getMovieDetails(id: Int) {
        remoteDataSource
            .remoteFetchAndMapping(target:
                                    AppEndPoints.fetchMovieDetails(id: id),
                                   type: MovieDetails.self) {[weak self] response, _ in
                guard let self else { return }
                switch response {
                case .success(let response):
                    self.presenter?.fetchedMoviesSucess(response: response)
                case .failure(let error):
                    self.presenter?.fetchedMoviesError(error: error)
                }
            }
    }
    
}
