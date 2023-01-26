//
//  HomeVC.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: BaseViewController {
    
    private var presenter: HomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear?()
    }
    
    // MARK: - Custom Setter
    public func setPresenter (presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
}

extension HomeVC: HomeViewProtocol {
    func reloadData() {
        print(presenter?.getMoviesCount())
    }
}
