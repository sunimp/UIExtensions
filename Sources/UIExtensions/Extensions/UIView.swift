//
//  UIView.swift
//  UIExtensions
//
//  Created by Sun on 2021/11/24.
//

import UIKit

import SnapKit

extension UIView {
    public enum GradientDirection {
        case topToBottom
        case leftToRight

        // MARK: Computed Properties

        public var startPoint: CGPoint {
            switch self {
            case .topToBottom:
                CGPoint(x: 0.5, y: 0)
            case .leftToRight:
                CGPoint(x: 0, y: 0.5)
            }
        }
        
        public var endPoint: CGPoint {
            switch self {
            case .topToBottom:
                CGPoint(x: 0.5, y: 1.0)
            case .leftToRight:
                CGPoint(x: 1.0, y: 0.5)
            }
        }
    }
    
    public enum ShadowPosition {
        case top(CGFloat)
        case left(CGFloat)
        case bottom(CGFloat)
        case right(CGFloat)
        
        case all(CGFloat)

        // MARK: Computed Properties

        var radius: CGFloat {
            switch self {
            case let .top(value):
                value
            case let .left(value):
                value
            case let .bottom(value):
                value
            case let .right(value):
                value
            case let .all(value):
                value
            }
        }
        
        var offset: CGSize {
            switch self {
            case let .top(value):
                CGSize(width: 0, height: -value)
            case let .left(value):
                CGSize(width: -value, height: 0)
            case let .bottom(value):
                CGSize(width: 0, height: value)
            case let .right(value):
                CGSize(width: value, height: 0)
            case .all:
                .zero
            }
        }
    }
}

extension UIView {
    @objc
    open var width: CGFloat {
        frame.size.width
    }
    
    @objc
    open var height: CGFloat {
        frame.size.height
    }
    
    @objc
    open var x: CGFloat {
        frame.origin.x
    }
    
    @objc
    open var y: CGFloat {
        frame.origin.y
    }
    
    @objc
    open var bottom: CGFloat {
        frame.origin.y + frame.size.height
    }
    
    @objc
    open var size: CGSize {
        frame.size
    }
    
    @objc
    open var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue != 0
        }
    }
    
    @objc
    open var borderWidth: CGFloat {
        get {
            layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @objc
    open var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @objc
    open var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @objc
    open var shadowOpacity: Float {
        get {
            layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @objc
    open var shadowRadius: CGFloat {
        get {
            layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @objc
    open var shadowOffset: CGSize {
        get {
            layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @objc
    open var shadowPath: CGPath? {
        get {
            layer.shadowPath
        }
        set {
            layer.shadowPath = newValue
        }
    }
    
    @objc
    open var masksToBounds: Bool {
        get {
            layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
}

extension UIView {
    public func set(
        hidden: Bool,
        animated: Bool = false,
        duration: TimeInterval = 0.3,
        completion: ((Bool) -> Void)? = nil
    ) {
        if isHidden == hidden {
            return
        }
        if animated {
            if !hidden {
                alpha = 0
                isHidden = false
            }
            UIView.animate(withDuration: duration, animations: {
                self.alpha = hidden ? 0 : 1
            }, completion: { success in
                self.alpha = 1
                self.isHidden = hidden
                completion?(success)
            })
        } else {
            isHidden = hidden
            completion?(true)
        }
    }
    
    public func shakeView(_ block: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(block)
        
        let animation = CAKeyframeAnimation(keyPath: "transform")
        let fromAnimation = NSValue(caTransform3D: CATransform3DMakeTranslation(-5, 0, 0))
        let toAnimation = NSValue(caTransform3D: CATransform3DMakeTranslation(5, 0, 0))
        
        animation.values = [fromAnimation, toAnimation]
        animation.autoreverses = true
        animation.repeatCount = 2
        animation.duration = 0.07
        layer.add(animation, forKey: "shakeAnimation")
        
        CATransaction.commit()
    }
    
    /// drawing on context methods
    public func createRoundedRectPath(for rect: CGRect, radius: CGFloat) -> CGMutablePath {
        let path = CGMutablePath()
        
        let midTopPoint = CGPoint(x: rect.midX, y: rect.minY)
        path.move(to: midTopPoint)
        
        let topRightPoint = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomRightPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        let bottomLeftPoint = CGPoint(x: rect.minX, y: rect.maxY)
        let topLeftPoint = CGPoint(x: rect.minX, y: rect.minY)
        
        path.addArc(tangent1End: topRightPoint, tangent2End: bottomRightPoint, radius: radius)
        path.addArc(tangent1End: bottomRightPoint, tangent2End: bottomLeftPoint, radius: radius)
        path.addArc(tangent1End: bottomLeftPoint, tangent2End: topLeftPoint, radius: radius)
        path.addArc(tangent1End: topLeftPoint, tangent2End: topRightPoint, radius: radius)
        
        path.closeSubpath()
        
        return path
    }
    
    public func setGradient(
        fromColor: UIColor,
        toColor: UIColor,
        direction: GradientDirection = .leftToRight,
        length: CGFloat? = nil
    ) {
        if let view = subviews.compactMap({ $0 as? GradientView }).first {
            view.updateGradient(
                fromColor: fromColor,
                toColor: toColor,
                direction: direction,
                length: length
            )
        } else {
            let view = GradientView(
                fromColor: fromColor,
                toColor: toColor,
                direction: direction,
                length: length
            )
            insertSubview(view, at: 0)
            view.snp.makeConstraints { maker in
                maker.edges.equalToSuperview()
            }
        }
    }
    
    public func setShadow(
        color: UIColor,
        position: ShadowPosition = .all(10),
        opacity: Float = 1
    ) {
        shadowColor = color
        shadowOpacity = opacity
        masksToBounds = position.radius <= 0
        shadowRadius = position.radius
        shadowOffset = position.offset
    }
    
    public func drawGradient(
        context: CGContext,
        rect: CGRect,
        colors: [CGColor],
        locations: [CGFloat]
    ) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors: CFArray = colors as CFArray
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations) else {
            return
        }
        let startPoint = CGPoint(x: rect.midX, y: rect.minY)
        let endPoint = CGPoint(x: rect.midX, y: rect.maxY)
        
        context.saveGState()
        context.addRect(rect)
        context.clip()
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
        context.restoreGState()
    }
}
