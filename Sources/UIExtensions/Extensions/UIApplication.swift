//
//  UIApplication+.swift
//  UIExtensions
//
//  Created by Sun on 2024/8/15.
//

import UIKit

extension UIApplication {
    
    public enum Environment {
        case debug
        case testFlight
        case appStore
    }
    
    public var inferredEnvironment: Environment {
#if DEBUG
        return .debug
#elseif targetEnvironment(simulator)
        return .debug
#else
        if Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") != nil {
            return .testFlight
        }
        
        guard let appStoreReceiptUrl = Bundle.main.appStoreReceiptURL else {
            return .debug
        }
        
        if appStoreReceiptUrl.lastPathComponent.lowercased() == "sandboxreceipt" {
            return .testFlight
        }
        
        if appStoreReceiptUrl.path.lowercased().contains("simulator") {
            return .debug
        }
        
        return .appStore
#endif
    }
    
    public var displayName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    public var buildNumber: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    public var version: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}

extension UIApplication {
    
    /// Active window
    public var activeWindow: UIWindow? {
        if #available(iOS 13, *) {
            return self.activeWindowScene?.windows.first(where: { $0.isKeyWindow })
        } else {
            return self.keyWindow
        }
    }
    
    /// Active windowScene
    public var activeWindowScene: UIWindowScene? {
        if #available(iOS 13, *) {
            return self.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .compactMap { $0 as? UIWindowScene }
                .first
        } else {
            return nil
        }
    }
    
    /// Active window statusBar style
    public var activeStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            if let statusBarManager = self.activeWindowScene?.statusBarManager {
                return statusBarManager.statusBarStyle
            } else {
                return .default
            }
        } else {
            return self.statusBarStyle
        }
    }
    
    /// Active window statusBar isHidden
    public var isActiveStatusBarHidden: Bool {
        if #available(iOS 13.0, *) {
            if let statusBarManager = self.activeWindowScene?.statusBarManager {
                return statusBarManager.isStatusBarHidden
            } else {
                return false
            }
        } else {
            return self.isStatusBarHidden
        }
    }
}
