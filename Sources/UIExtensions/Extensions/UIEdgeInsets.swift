//
//  UIEdgeInsets+.swift
//  CryptoWallet
//
//  Created by Sun on 2024/8/19.
//

import UIKit

extension UIEdgeInsets {
    
    public var width: CGFloat {
        left + right
    }
    
    public var height: CGFloat {
        top + bottom
    }
    
    public func add(_ other: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(top: top + other.top, left: left + other.left, bottom: bottom + other.bottom, right: right + other.right)
    }
    
    public static func only(
        top: CGFloat = 0.0,
        left: CGFloat = 0.0,
        bottom: CGFloat = 0.0,
        right: CGFloat = 0.0
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    public static func symmetric(
        vertical: CGFloat = 0.0,
        horizontal: CGFloat = 0.0
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    public static func all(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    public var horizontal: CGFloat {
        return self.left + self.right
    }
    
    public var vertical: CGFloat {
        return self.top + self.bottom
    }
}
