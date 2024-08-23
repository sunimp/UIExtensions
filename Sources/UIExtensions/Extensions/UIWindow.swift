//
//  UIWindow+.swift
//  UIExtensions
//
//  Created by Sun on 2024/8/19.
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
        if let statusBarManager = self.keyWindow?.windowScene?.statusBarManager {
            return statusBarManager.statusBarStyle
        } else {
            return .default
        }
    }
    
    /// Active window statusBar isHidden
    public static var isStatusBarHidden: Bool {
        if let statusBarManager = self.keyWindow?.windowScene?.statusBarManager {
            return statusBarManager.isStatusBarHidden
        } else {
            return false
        }
    }
}
