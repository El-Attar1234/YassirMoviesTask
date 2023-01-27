//
//  HomeProtocols.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import Foundation

// MARK: - ViewController -> Presenter
protocol HomePresenterProtocol: BasePresenterProtocol {
    func getMovies()
    func refresh()
    func loadMore()
    func getMoviesCount() -> Int
    func getMovie(item: Int) -> Movie
    func didSelect(item: Int)
}

// MARK: - Presenter -> ViewController
protocol HomeViewProtocol: BaseViewProtocal {
    func reloadData()
}

// MARK: - Presenter -> Interactor
protocol HomeInteractorInputProtocol: AnyObject {
    func getMovies(page: Int)
}

// MARK: - Interactor -> Presenter
protocol HomeInteractorOutputProtocol: AnyObject {
    func fetchedMoviesSucess(response: ServerResponse<[Movie]>?)
    func fetchedMoviesError(error: NetworkError)
}

// MARK: - Router
protocol HomeRouterProtocol: AnyObject {
    func navigateToMovieDetails(id: Int)
}
