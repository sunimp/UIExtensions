//
//  TintImageView.swift
//  UIExtensions
//
//  Created by Sun on 2024/8/19.
//

import UIKit

public class TintImageView: UIImageView, RespondViewDelegate {
    
    public var touchTransparent: Bool { false }

    private var _tintColor: UIColor?
    private var selectedTintColor: UIColor?
    private var isTintMode = false
    
    override public var tintColor: UIColor! {
        get {
            super.tintColor
        }
        set {
            isTintMode = newValue != nil
            super.tintColor = newValue
        }
    }
    
    override public var image: UIImage? {
        get {
            super.image
        }
        set {
            guard isTintMode else {
                super.image = newValue
                return
            }
            super.image = newValue?.withRenderingMode(.alwaysTemplate)
        }
    }

    public init() {
        super.init(frame: .zero)
    }

    public init(image: UIImage?, tintColor: UIColor, selectedTintColor: UIColor) {
        super.init(image: image?.withRenderingMode(.alwaysTemplate))
        self.tintColor = tintColor
        self.selectedTintColor = selectedTintColor
    }

    public init(image: UIImage?, selectedImage: UIImage?) {
        super.init(image: image)
        highlightedImage = selectedImage
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func touchBegan() {
        if highlightedImage != nil {
            isHighlighted = true
        } else {
            _tintColor = tintColor
            tintColor = selectedTintColor
        }
    }

    public func touchEnd() {
        isHighlighted = false
        tintColor = _tintColor
    }

}
