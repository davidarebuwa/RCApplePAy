//
//  Router.swift
//  PADGeneral
//
//  Created by Us on 08/06/2020.
//  Copyright © 2020 David Arebuwa. All rights reserved.
//

import UIKit

public protocol AppNavigation {
    func viewcontrollerForNavigation(route: Routes) -> UIViewController
    func navigate(_ navigation: Routes, from: UIViewController?, to: UIViewController)
}

public protocol IsRouter {
    func setupAppNavigation(appNavigation: AppNavigation)
    func navigate(_ route: Routes, from: UIViewController)
    var appNavigation: AppNavigation? { get }
}

public extension UIViewController {
    func navigate(_ route: Routes) {
           Router.shared.navigate(route, from: self)
       }
}

public extension UIStoryboard {
    static func view(named: String) -> UIViewController {
        let board = UIStoryboard(name: named, bundle: .main)
        return board.instantiateInitialViewController()!
    }
}

public class Router {
    public static let shared: Router = Router()
    public var appNavigation: AppNavigation?
    private init() { }

    public static func configure() {
        let appNavigation = AppNavigator()
        Router.shared.appNavigation = appNavigation

    }

    public func navigate(_ route: Routes, from: UIViewController?) {
        if let toVC = appNavigation?.viewcontrollerForNavigation(route: route) {
            appNavigation?.navigate(route, from: from, to: toVC)
        }
    }

}
