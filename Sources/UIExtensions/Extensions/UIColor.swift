//
//  UIColor.swift
//  UIExtensions
//
//  Created by Sun on 2021/11/24.
//

import UIKit

extension UIColor {
    public var hsbaColor: UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
    }
    
    public var rgba: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)? {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        guard getRed(&r, green: &g, blue: &b, alpha: &a) else {
            return nil
        }
        return (r, g, b, a)
    }

    // Usage: UIColor(hex: 0xFC0ACE, alpha: 0.25)
    public convenience init(hex: Int, alpha: CGFloat = 1) {
        self.init(
            displayP3Red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    public func alpha(_ alpha: CGFloat) -> UIColor {
        withAlphaComponent(alpha)
    }
    
    public func blend(with top: UIColor) -> UIColor {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        top.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

        r1 = a2 * r2 + (1 - a2) * r1
        g1 = a2 * g2 + (1 - a2) * g1
        b1 = a2 * b2 + (1 - a2) * b1

        return UIColor(red: min(1, r1), green: min(1, g1), blue: min(1, b1), alpha: a1)
    }
}
