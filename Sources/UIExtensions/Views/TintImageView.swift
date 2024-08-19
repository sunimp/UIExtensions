//
//  TintImageView.swift
//  CryptoWallet
//
//  Created by Sun on 2024/8/19.
//

import UIKit

public class TintImageView: UIImageView, RespondViewDelegate {
    
    public var touchTransparent: Bool { return false }

    private var _tintColor: UIColor?
    private var selectedTintColor: UIColor?
    private var isTintMode = false
    
    public override var tintColor: UIColor! {
        get {
            return super.tintColor
        }
        set {
            isTintMode = newValue != nil
            super.tintColor = newValue
        }
    }
    
    public override var image: UIImage? {
        get {
            return super.image
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
        self.highlightedImage = selectedImage
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
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
