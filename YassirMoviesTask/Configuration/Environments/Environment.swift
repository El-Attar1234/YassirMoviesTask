//
//  Environment.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import Foundation
public enum Environment {
    
    // MARK: - Keys
    enum PlistKeys {
        static let baseURL = "BASE_URL"
        static let apiKey = "API_KEY"
        
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let baseURL: URL = {
        guard let rootURLString = Environment.infoDictionary[PlistKeys.baseURL] as? String else {
            fatalError("Base URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLString) else {
            fatalError("Base URL is invalid")
        }
        return url
    }()
    
    static let apiKey: String = {
        guard let apiKeyString = Environment.infoDictionary[PlistKeys.apiKey] as? String else {
            fatalError("Api Key not set in plist for this environment")
        }
        return apiKeyString
    }()
    
}
