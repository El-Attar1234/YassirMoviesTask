//
//  HomeVC.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import UIKit
import Hero

class HomeVC: BaseViewController {
    @IBOutlet private weak var moviesTableView: UITableView! {
        didSet {
            moviesTableView.dataSource = self
            moviesTableView.delegate   = self
            moviesTableView.register(cellType: MovieCell.self)
        }
    }
    
    private var presenter: HomePresenterProtocol?
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.refreshControl = refreshControl
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear?()
    }
    
    // MARK: - Custom Setter
    public func setPresenter (presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
    @objc
    private func refreshWeatherData(_ sender: Any) {
        presenter?.refresh()
    }
}

extension HomeVC: HomeViewProtocol {
    func reloadData() {
        refreshControl.endRefreshing()
        moviesTableView.reloadData()
    }
}

extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           presenter?.getMoviesCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: MovieCell.self, for: indexPath)
        cell.setup(movie: presenter?.getMovie(item: indexPath.item))
        return cell
    }
}

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("HEEEEro \(presenter?.getMovie(item: indexPath.item).id)")
        presenter?.didSelect(item: indexPath.item)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item ==  (presenter?.getMoviesCount() ?? 0) - 2 {
            presenter?.loadMore()
        }
    }
}
