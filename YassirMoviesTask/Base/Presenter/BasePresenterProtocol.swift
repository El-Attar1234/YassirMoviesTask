//
//  BasePresenterProtocol.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import Foundation

typealias BasePresenterProtocol = PresenterLifeCycleProtocol

@objc
protocol PresenterLifeCycleProtocol: AnyObject {

    @objc
    optional func loadView()

    @objc
    optional func viewDidLoad()

    @objc
    optional func viewWillAppear()

    @objc
    optional func viewDidAppear()

    @objc
    optional func didReceiveMemoryWarning()

    @objc
    optional func viewWillDisappear()

    @objc
    optional func viewDidDisappear()
}
