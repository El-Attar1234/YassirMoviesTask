//
//  HomeVC.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Environment.baseURL)
        DataSource
            .provideNetworkDataSource()
            .remoteFetchAndMapping(target:
                                    AppEndPoints.fetchMovies(page: 1),
                                   type: ServerResponse<[Movie]>.self) { response, statusCode in
            switch response {
            case .success(let response1):
                print(response1?.results?.count)
            case .failure(let error):
                print(error)
            }
        }

    }

}
