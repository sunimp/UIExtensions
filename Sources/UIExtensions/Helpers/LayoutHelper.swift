//
//  LayoutHelper.swift
//  UIExtensions
//
//  Created by Sun on 2024/8/19.
//

import UIKit

public class LayoutHelper {
    
    public static let shared = LayoutHelper()

    private init() { }

    public var contentMarginWidth: CGFloat {
        marginContentInset * 2 + safeInsets().horizontal
    }

    public lazy var marginContentInset: CGFloat = {
        let width = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        return width < 385 || width > 760 ? 15 : 20
    }()

    public static func sizeForContainer(size: CGSize?) -> CGSize {
        var size = size ?? UIScreen.main.bounds.size
        let insets = LayoutHelper.shared.safeInsets(for: nil)
        size.width = max(0, size.width - insets.horizontal)
        size.height = max(0, size.height - insets.vertical)
        return size
    }

    public func getSingleMediaSize(
        width: Int,
        height: Int,
        minHeight: CGFloat = 50,
        maxHeight: CGFloat = 150,
        minWidth: CGFloat,
        maxWidth: CGFloat
    ) -> CGSize {
        let imageWidth = width > 0 ? CGFloat(abs(width)) / UIScreen.main.scale : minWidth
        let imageHeight = height > 0 ? CGFloat(abs(height)) / UIScreen.main.scale : minHeight

        let imageRatio = imageWidth / imageHeight
        let containerRatio = maxWidth / maxHeight

        var width = containerRatio > imageRatio ? imageWidth * maxHeight / imageHeight : maxWidth
        var height = containerRatio > imageRatio ? maxHeight : imageHeight * maxWidth / imageWidth

        if width < minWidth {
            width = minWidth
            height = min(maxHeight, height * minWidth / width)
        } else if height < minHeight {
            width = min(maxWidth, width * minHeight / height)
            height = minHeight
        }

        return CGSize(width: floor(width), height: floor(height))
    }

    public func safeInsets(for view: UIView? = nil) -> UIEdgeInsets {
        if let view {
            view.safeAreaInsets
        } else {
            UIWindow.keyWindow?.safeAreaInsets ?? .zero
        }
    }
}
