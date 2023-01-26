//
//  MovieDetailsRouter.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 27/01/2023.
//

import UIKit

class MovieDetailsRouter {
    
    private weak var viewController: UIViewController?
    
    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func createModule(id: Int) -> MovieDetailsVC {
        let view = MovieDetailsVC()
        let interactor = MovieDetailsInteractor()
        let router = MovieDetailsRouter(with: view)
        let presenter = MovieDetailsPresenter(id: id, interface: view, interactor: interactor, router: router)
        view.setPresenter(presenter: presenter)
        interactor.setPresenter(presenter: presenter)
        return view
    }
}

extension MovieDetailsRouter: MovieDetailsRouterProtocol {

}
