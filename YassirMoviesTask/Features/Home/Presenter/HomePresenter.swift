//
//  HomePresenter.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import Foundation

class HomePresenter {
    
    private weak var view: HomeViewProtocol?
    private var interactor: HomeInteractorInputProtocol?
    private var router: HomeRouterProtocol?
    
    private var currentPage = 1
    private var totalResultsCount = 0
    private var movise: [Movie] = []
  //  private var homeData: HomeModel = HomeModel()
    
    init(interface: HomeViewProtocol,
         interactor: HomeInteractorInputProtocol?,
         router: HomeRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresenterProtocol {
    func viewWillAppear() {
        view?.showLoadingIndicator?()
        currentPage = 1
        movise = []
        interactor?.getMovies(page: currentPage)
    }
    func getMovies() {
        interactor?.getMovies(page: currentPage)
    }
    
    func getMoviesCount() -> Int {
        movise.count
    }
    func getMovie(item: Int) -> Movie {
        movise[item]
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func fetchedMoviesSucess(response: ServerResponse<[Movie]>?) {
        view?.hideLoadingIndicator?()
        movise += response?.results ?? []
        totalResultsCount = response?.totalResults ?? 0
        view?.reloadData()
    }
    
    func fetchedMoviesError(error: NetworkError) {
        view?.hideLoadingIndicator?()
        view?.showError(withMessage: error.localizedDescription)
    }
    
}
