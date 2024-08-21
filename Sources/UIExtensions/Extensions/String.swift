//
//  String+.swift
//  UIExtensions
//
//  Created by Sun on 2024/8/19.
//

import UIKit

extension String {

    public func height(forContainerWidth containerWidth: CGFloat, font: UIFont) -> CGFloat {
        size(containerWidth: containerWidth, font: font).height
    }
    
    public func width(forContainerHeight containerHeight: CGFloat, font: UIFont) -> CGFloat {
        size(containerHeight: containerHeight, font: font).width
    }
    
    public func size(
        containerWidth: CGFloat = .greatestFiniteMagnitude,
        containerHeight: CGFloat = .greatestFiniteMagnitude,
        font: UIFont,
        maxLines: Int = 0
    ) -> CGSize {
        guard !self.isEmpty else {
            return .zero
        }
        let textStorage = NSTextStorage(string: self)
        textStorage.addAttributes(
            [NSAttributedString.Key.font: font],
            range: NSRange(location: 0, length: textStorage.length)
        )
        
        let maxSize = CGSize(width: containerWidth, height: containerHeight)
        let textContainer = NSTextContainer(size: maxSize)
        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = maxLines
        
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        layoutManager.glyphRange(for: textContainer)
        let textBounds = layoutManager.usedRect(for: textContainer)
        return textBounds.size
    }
}
