//
//  BaseViewController.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import SwiftMessages
import MBProgressHUD

class BaseViewController: UIViewController {
    
    private var loadingView: MBProgressHUD!
   
    func setUpNavBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        self.navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
}

// MARK: - Handling for loading, success and errors message
extension BaseViewController: BaseViewProtocal {
    
    func showError(withMessage: String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.button?.isHidden = true
        view.configureTheme(.error)
        view.configureDropShadow()
        var config = SwiftMessages.Config()
        config.presentationContext = .window(windowLevel: .statusBar)
        view.configureContent(title: "", body: withMessage)
        view.layoutMarginAdditions = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        SwiftMessages.show(config: config, view: view)
    }
    
    func showSuccess(withMessage: String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.button?.isHidden = true
        view.configureTheme(.success)
        view.configureDropShadow()
        var config = SwiftMessages.Config()
        config.presentationContext = .window(windowLevel: .statusBar)
        view.configureContent(title: "", body: withMessage)
        view.layoutMarginAdditions = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        SwiftMessages.show(config: config, view: view)
    }
    
    func showLoadingIndicator() {
        if loadingView != nil {
            loadingView = nil
        }
        loadingView = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingView.mode = MBProgressHUDMode.indeterminate
    }
    
    func hideLoadingIndicator() {
        if loadingView != nil {
            loadingView.hide(animated: true)
            loadingView = nil
        }
    }
}
