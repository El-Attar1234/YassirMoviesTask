//
//  DataSource.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import Foundation

class DataSource {
    static func provideNetworkDataSource() -> NetworkManagerProtocol {
        return NetworkManager.shared
    }
}
