//
//  UIEdgeInsets+.swift
//  UIExtensions
//
//  Created by Sun on 2024/8/19.
//

import UIKit

extension UIEdgeInsets {
    
    public var horizontal: CGFloat {
        return self.left + self.right
    }
    
    public var vertical: CGFloat {
        return self.top + self.bottom
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
    
    public func add(_ other: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(
            top: self.top + other.top,
            left: self.left + other.left,
            bottom: self.bottom + other.bottom,
            right: self.right + other.right
        )
    }
}
