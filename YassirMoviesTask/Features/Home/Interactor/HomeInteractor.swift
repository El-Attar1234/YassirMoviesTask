//
//  HomeInteractor.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import Foundation

class HomeInteractor {
    
    private weak var remoteDataSource: NetworkManagerProtocol!
    private weak var presenter: HomeInteractorOutputProtocol?
    
    init(remoteDataSource: NetworkManagerProtocol = DataSource.provideNetworkDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    // MARK: - Custom Setter
    public func setPresenter (presenter: HomeInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

// MARK: - Remote Fetching
extension HomeInteractor: HomeInteractorInputProtocol {
    func getMovies(page: Int) {
        remoteDataSource
            .remoteFetchAndMapping(target:
                                    AppEndPoints.fetchMovies(page: page),
                                   type: ServerResponse<[Movie]>.self) {[weak self] response, _ in
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
