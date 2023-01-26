//
//  HomeVC.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import UIKit


class HomeVC: BaseViewController {
    @IBOutlet private weak var moviesTableView: UITableView!{
        didSet {
            moviesTableView.dataSource = self
            moviesTableView.delegate   = self
            moviesTableView.register(cellType: MovieCell.self)
        }
    }
    
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
        presenter?.didSelect(item: indexPath.item)
    }
}
