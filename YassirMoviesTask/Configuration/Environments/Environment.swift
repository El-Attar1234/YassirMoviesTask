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
        guard let rootURLstring = Environment.infoDictionary[PlistKeys.baseURL] as? String else {
            fatalError("Base URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("Base URL is invalid")
        }
        return url
    }()
    
}
