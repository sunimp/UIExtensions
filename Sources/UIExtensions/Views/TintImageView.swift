//
//  TintImageView.swift
//  UIExtensions
//
//  Created by Sun on 2021/11/24.
//

import UIKit

public class TintImageView: UIImageView, RespondViewDelegate {
    // MARK: Overridden Properties

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

    // MARK: Properties

    private var _tintColor: UIColor?
    private var selectedTintColor: UIColor?
    private var isTintMode = false

    // MARK: Computed Properties

    public var touchTransparent: Bool { false }

    // MARK: Lifecycle

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

    // MARK: Functions

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
