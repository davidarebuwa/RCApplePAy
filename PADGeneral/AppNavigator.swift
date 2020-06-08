//
//  AppNavigator.swift
//  PADGeneral
//
//  Created by Us on 08/06/2020.
//  Copyright © 2020 David Arebuwa. All rights reserved.
//

import UIKit
import RoundCode

public indirect enum Routes{
    case mainView
    case payView(animated: Bool)
}

public struct AppNavigator: AppNavigation{
    
    public func viewcontrollerForNavigation(route: Routes) -> UIViewController {
        switch route{
        case .mainView:
            return UIStoryboard.view(named: "ViewController")
        case .payView:
            return UIStoryboard.view(named: "CameraView")
        }
    }
    
    public func navigate(_ navigation: Routes, from: UIViewController?, to: UIViewController) {
        switch navigation{
        case .mainView:
            from?.present(to, animated: true)
        case .payView(let animated):
            if animated, let rootView = UIApplication.shared.delegate?.window??.rootViewController {
                UIView.transition(from: rootView.view, to: to.view, duration: 0.25, options: [.transitionCrossDissolve], completion: { _ in
                    UIApplication.shared.delegate?.window??.rootViewController = to
                })
            } else {
                UIApplication.shared.delegate?.window??.rootViewController = to
            }
        }
    }
}

