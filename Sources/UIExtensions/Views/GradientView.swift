//
//  GradientView.swift
//  UIExtensions
//
//  Created by Sun on 2024/8/19.
//

import UIKit

open class GradientView: UIView {
    
    public let gradientLayer = CAGradientLayer()

    private var fromColor: UIColor
    private var toColor: UIColor
    private var direction: GradientDirection
    private var length: CGFloat?

    public init(
        fromColor: UIColor,
        toColor: UIColor,
        direction: GradientDirection = .leftToRight,
        length: CGFloat? = nil
    ) {
        self.fromColor = fromColor
        self.toColor = toColor
        self.direction = direction
        self.length = length

        super.init(frame: .zero)

        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = direction.startPoint
        layer.addSublayer(gradientLayer)

        updateUITheme()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
        var endPoint = direction.endPoint
        if let length {
            switch direction {
            case .leftToRight:
                endPoint.x = length / bounds.width
                
            case .topToBottom:
                endPoint.y = length / bounds.height
            }
        }
        gradientLayer.endPoint = endPoint
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        updateUITheme()
    }

    open func updateUITheme() {
        gradientLayer.colors = [fromColor.cgColor, toColor.cgColor]
    }
    
    open func updateGradient(
        fromColor: UIColor,
        toColor: UIColor,
        direction: GradientDirection = .leftToRight,
        length: CGFloat? = nil
    ) {
        self.fromColor = fromColor
        self.toColor = toColor
        self.direction = direction
        self.length = length
        
        gradientLayer.startPoint = direction.startPoint
        updateUITheme()
        setNeedsLayout()
    }
}
