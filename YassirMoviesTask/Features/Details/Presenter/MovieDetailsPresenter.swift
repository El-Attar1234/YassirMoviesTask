//
//  MovieDetailsPresenter.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 27/01/2023.
//

import Foundation

class MovieDetailsPresenter {
    
    private weak var view: MovieDetailsViewProtocol?
    private var interactor: MovieDetailsInteractorInputProtocol?
    private var router: MovieDetailsRouterProtocol?
    private var id: Int
    
    init(id: Int,
         interface: MovieDetailsViewProtocol,
         interactor: MovieDetailsInteractorInputProtocol?,
         router: MovieDetailsRouterProtocol) {
        self.id = id
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
}

extension MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    func getMovieID() -> Int {
        id
    }
    
    func getMovieDetails() {
        view?.showLoadingIndicator?()
        interactor?.getMovieDetails(id: id)
    }

}

extension MovieDetailsPresenter: MovieDetailsInteractorOutputProtocol {
    func fetchedMoviesSucess(response: MovieDetails?) {
        view?.hideLoadingIndicator?()
        view?.fetchedData(movie: response)
    }
    
    func fetchedMoviesError(error: NetworkError) {
        view?.hideLoadingIndicator?()
        view?.showError(withMessage: error.localizedDescription)
    }
    
}
