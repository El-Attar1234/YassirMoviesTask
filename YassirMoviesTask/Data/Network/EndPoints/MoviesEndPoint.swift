//
//  MoviesEndPoint.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import Foundation
import Moya

enum AppEndPoints {
    case fetchMovies(page: Int)
}

extension AppEndPoints: TargetType {

    var baseURL: URL {
        Environment.baseURL
        
    }
    
    var path: String {
        switch self {
        case .fetchMovies:
            return "/discover/movie"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchMovies:
            return .get
        }
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .fetchMovies(let page):
            var params: [String: Any] = [:]
            params["page"] = page
            params["api_key"] = Environment.apiKey
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
            
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
}
