//
//  UIWindow.swift
//
//  Created by Sun on 2021/11/24.
//

import UIKit

extension UIWindow {
    public func set(newRootController: UIViewController) {
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)

        layer.add(transition, forKey: kCATransition)

        let oldRootController = rootViewController

        rootViewController = newRootController

        oldRootController?.dismiss(animated: false) {
            oldRootController?.view.removeFromSuperview()
        }
    }
}

extension UIWindow {
    /// Key Window
    public static var keyWindow: UIWindow? {
        let allScenes = UIApplication.shared.connectedScenes
        for scene in allScenes {
            guard let windowScene = scene as? UIWindowScene else {
                continue
            }
            for window in windowScene.windows where window.isKeyWindow {
                return window
            }
        }
        return nil
    }
    
    /// Key Window statusBarStyle
    public static var statusBarStyle: UIStatusBarStyle {
        if let statusBarManager = keyWindow?.windowScene?.statusBarManager {
            statusBarManager.statusBarStyle
        } else {
            .default
        }
    }
    
    /// Key Window isStatusBarHidden
    public static var isStatusBarHidden: Bool {
        if let statusBarManager = keyWindow?.windowScene?.statusBarManager {
            statusBarManager.isStatusBarHidden
        } else {
            false
        }
    }
}
