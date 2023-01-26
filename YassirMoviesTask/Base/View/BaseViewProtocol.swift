//
//  BaseViewProtocol.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import UIKit

typealias BaseViewProtocal = ViewIndicatorProtocal & Toastermessages

@objc
protocol ViewIndicatorProtocal: AnyObject {

    // MARK: - Load Indicator
    @objc
    optional func showLoadingIndicator()
    @objc
    optional func hideLoadingIndicator()
}

@objc
protocol Toastermessages: AnyObject {

    @objc
    func showError(withMessage: String)
    @objc
    func showSuccess(withMessage: String)
}
