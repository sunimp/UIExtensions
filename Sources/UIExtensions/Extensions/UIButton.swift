//
//  UIButton+.swift
//
//  Created by Sun on 2024/8/19.
//

import UIKit

extension UIButton {
    
    public func setBackgroundColor(
        color: UIColor,
        gradient: (colors: [UIColor], height: CGFloat)? = nil,
        forState state: UIControl.State
    ) {
        let height = gradient?.height ?? 1
        var gradientLayer: CAGradientLayer?

        if let gradient = gradient {
            gradientLayer = CAGradientLayer()
            gradientLayer?.locations = [0.0, 1.0]
            gradientLayer?.colors = gradient.colors.map { $0.cgColor }
            gradientLayer?.frame = CGRect(x: 0, y: 0, width: 1, height: height)
        }
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1, height: height))
        let colorImage = renderer.image { context in
            let cgContext = context.cgContext
            cgContext.setFillColor(color.cgColor)
            cgContext.fill(CGRect(x: 0, y: 0, width: 1, height: height))
            gradientLayer?.render(in: cgContext)
        }
        setBackgroundImage(colorImage, for: state)
    }
}

