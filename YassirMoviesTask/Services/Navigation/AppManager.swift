//
//  AppManager.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import UIKit

final class AppManager {
    
    static var shared: AppManager = AppManager()
    private(set) var window: UIWindow?
    
    private init() {
    }
    
    func initWindow(_ window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)) {
        self.window = window
        window?.rootViewController = SceneContainer.embedVCInNavController(SceneContainer.getHomeVc())
        window?.makeKeyAndVisible()
        
    }
    
    func setRootView(viewController: UIViewController) {
        window?.rootViewController = viewController
        
    }
}
