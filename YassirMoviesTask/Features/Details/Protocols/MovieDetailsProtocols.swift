//
//  MovieDetailsProtocols.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 27/01/2023.
//

import Foundation

// MARK: - ViewController -> Presenter
protocol MovieDetailsPresenterProtocol: BasePresenterProtocol {
    func getMovieDetails()
}

// MARK: - Presenter -> ViewController
protocol MovieDetailsViewProtocol: BaseViewProtocal {
    func fetchedData(movie: MovieDetails?)
}

// MARK: - Presenter -> Interactor
protocol MovieDetailsInteractorInputProtocol: AnyObject {
    func getMovieDetails(id: Int)
}

// MARK: - Interactor -> Presenter
protocol MovieDetailsInteractorOutputProtocol: AnyObject {
    func fetchedMoviesSucess(response: MovieDetails?)
    func fetchedMoviesError(error: NetworkError)
}

// MARK: - Router
protocol MovieDetailsRouterProtocol: AnyObject {
}
