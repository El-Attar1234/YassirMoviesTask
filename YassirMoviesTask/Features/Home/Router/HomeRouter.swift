//
//  HomeRouter.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import UIKit

class HomeRouter {
    
    private weak var viewController: UIViewController?
    
    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func createModule() -> HomeVC {
        let view = HomeVC()
        let interactor = HomeInteractor()
        let router = HomeRouter(with: view)
        let presenter = HomePresenter(interface: view, interactor: interactor, router: router)
        view.setPresenter(presenter: presenter)
        interactor.setPresenter(presenter: presenter)
        return view
    }
}

extension HomeRouter: HomeRouterProtocol {
    func navigateToMovieDetails(id: Int) {
        let vc = SceneContainer.getMovieDetailsVC()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
