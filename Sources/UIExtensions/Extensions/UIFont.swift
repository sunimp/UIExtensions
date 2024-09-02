//
//  UIFont.swift
//
//  Created by Sun on 2021/11/24.
//

import UIKit

extension UIFont {
    public func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(traits) else {
            return self
        }

        return UIFont(descriptor: descriptor, size: 0)
    }
}
