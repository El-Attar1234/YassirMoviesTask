//
//  NSObject+Ext.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import Foundation

public protocol ClassNameProtocol {
    static var className: String { get }
}

extension NSObject: ClassNameProtocol {}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
}
