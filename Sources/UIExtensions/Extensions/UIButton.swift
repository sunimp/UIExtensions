//
//  UIButton+.swift
//  UIExtensions
//
//  Created by Sun on 2024/8/19.
//

import UIKit

extension UIButton {
    
    public func setBackgroundColor(
        _ color: UIColor,
        gradient: (colors: [UIColor], direction: UIView.GradientDirection)? = nil,
        for state: UIControl.State
    ) {
        var gradientLayer: CAGradientLayer?
        if let gradient {
            gradientLayer = CAGradientLayer()
            gradientLayer?.locations = [0.0, 1.0]
            gradientLayer?.colors = gradient.colors.map { $0.cgColor }
            gradientLayer?.startPoint = gradient.direction.startPoint
            gradientLayer?.endPoint = gradient.direction.endPoint
            gradientLayer?.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        }
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1))
        let colorImage = renderer.image { context in
            let cgContext = context.cgContext
            cgContext.setFillColor(color.cgColor)
            cgContext.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            gradientLayer?.render(in: cgContext)
        }
        setBackgroundImage(colorImage, for: state)
    }
}

