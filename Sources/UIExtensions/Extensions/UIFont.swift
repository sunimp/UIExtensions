//
//  UIFont+.swift
//  CryptoWallet
//
//  Created by Sun on 2024/8/19.
//

import UIKit

extension UIFont {

    public func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(traits) else {
            return self
        }

        return UIFont(descriptor: descriptor, size: 0)
    }

}
