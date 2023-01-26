//
//  ServerResponse.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import Foundation

struct ServerResponse<T: Codable>: Codable {
    let results: T?
    let page, totalPages, totalResults: Int?

       enum CodingKeys: String, CodingKey {
           case results, page
           case totalPages = "total_pages"
           case totalResults = "total_results"
       }
}
