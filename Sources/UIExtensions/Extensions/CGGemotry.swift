//
//  CGGemotry.swift
//  UIExtensions
//
//  Created by Sun on 2024/8/25.
//

import UIKit

extension CGFloat {
    
    public var ceiled: CGFloat {
        ceil(self)
    }
    
    public var flat: CGFloat {
        let scale = UIWindow.keyWindow?.windowScene?.screen.scale ?? 1
        return (self * scale).ceiled / scale
    }
    
    public func centre(_ other: CGFloat) -> CGFloat {
        return ((self - other) / 2.0).flat
    }
}

extension CGSize {
    
    public static func only(
        width: CGFloat = 0.0,
        height: CGFloat = 0.0
    ) -> CGSize {
        return CGSize(width: width, height: height)
    }
    
    public static func all(_ value: CGFloat) -> CGSize {
        return CGSize(width: value, height: value)
    }
}

extension CGRect {
    
    public var flatted: CGRect {
        return CGRect(
            x: origin.x.flat,
            y: origin.y.flat,
            width: size.width.flat,
            height: size.height.flat
        )
    }
    
    public var ceiled: CGRect {
        CGRect(
            x: origin.x.ceiled,
            y: origin.y.ceiled,
            width: size.width.ceiled,
            height: size.height.ceiled
        )
    }
    
    public func resizeBy(dx: CGFloat, dy: CGFloat) -> CGRect {
        var rect = self
        rect.size.width = max(0, rect.size.width + dx)
        rect.size.height = max(0, rect.size.height + dy)
        return rect
    }
    
    public static func size(
        width: CGFloat = 0.0,
        height: CGFloat = 0.0
    ) -> CGRect {
        return only(width: width, height: height)
    }
    
    public static func only(
        origin: CGPoint = .zero,
        size: CGSize = .zero
    ) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    
    public static func only(
        x: CGFloat = 0.0,
        y: CGFloat = 0.0,
        width: CGFloat = 0.0,
        height: CGFloat = 0.0
    ) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
}

extension CGVector {
    
    public static func only(
        dx: CGFloat = 0.0,
        dy: CGFloat = 0.0
    ) -> CGVector {
        return CGVector(dx: dx, dy: dy)
    }
    
    public static func all(_ value: CGFloat) -> CGVector {
        return CGVector(dx: value, dy: value)
    }
    
}

extension UIEdgeInsets {
    
    public var horizontal: CGFloat {
        return self.left + self.right
    }
    
    public var vertical: CGFloat {
        return self.top + self.bottom
    }
    
    public func add(_ other: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: self.top + other.top,
            left: self.left + other.left,
            bottom: self.bottom + other.bottom,
            right: self.right + other.right
        )
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
}

extension CGRect {
    
    public func setX(_ x: CGFloat) -> CGRect {
        var rect = self
        rect.origin.x = x.flat
        return rect
    }
    
    public func setY(_ y: CGFloat) -> CGRect {
        var rect = self
        rect.origin.y = y.flat
        return rect
    }
    
    public func setXY(_ x: CGFloat, _ y: CGFloat) -> CGRect {
        var rect = self
        rect.origin.x = x.flat
        rect.origin.y = y.flat
        return rect
    }
    
    public func setWidth(_ width: CGFloat) -> CGRect {
        var rect = self
        rect.size.width = width.flat
        return rect
    }
    
    public func setHeight(_ height: CGFloat) -> Self {
        var rect = self
        rect.size.height = height.flat
        return rect
    }
}
