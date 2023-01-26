//
//  SceneContainer.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import UIKit

final class AppNavigationController: UINavigationController {}

final class SceneContainer {
    
    class func embedVCInNavController(_ viewController: UIViewController) -> UIViewController {
        let nav = AppNavigationController(rootViewController: viewController)
        return nav
    }
    static func getHomeVC() -> HomeVC {
        let vc = HomeRouter.createModule()
        return vc
    }
}
