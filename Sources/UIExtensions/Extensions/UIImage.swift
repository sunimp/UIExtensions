//
//  UIImage+.swift
//  UIExtensions
//
//  Created by Sun on 2024/8/19.
//

import UIKit

extension UIImage {
    
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { context in
            color.setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }
        guard let cgImage = image.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    public convenience init?(
        fromColor: UIColor,
        toColor: UIColor,
        size: CGSize,
        startPoint: CGPoint = CGPoint(x: 0.5, y: 0),
        endPoint: CGPoint = CGPoint(x: 0.5, y: 1)
    ) {
        let layer = CAGradientLayer()
        layer.startPoint = startPoint
        layer.endPoint = endPoint
        layer.frame = CGRect(origin: CGPoint.zero, size: size)
        layer.colors = [fromColor.cgColor, toColor.cgColor]
        
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { context in
            layer.render(in: context.cgContext)
        }
        
        guard let cgImage = image.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    public func resize(_ size: CGSize, cornerRadius: CGFloat? = nil) -> UIImage? {
        guard size.width > 0, size.height > 0 else {
            return self
        }
        let rect = CGRect(origin: .zero, size: size)
        let format = UIGraphicsImageRendererFormat.default()
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        let image = renderer.image { _ in
            if let cornerRadius, cornerRadius > 0 {
                let path = UIBezierPath(
                    roundedRect: rect,
                    byRoundingCorners: .allCorners,
                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
                )
                path.close()
                path.addClip()
            }
            self.draw(in: rect)
        }
        return image
    }
    
    public func tint(_ color: UIColor) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: self.size)
            color.set()
            context.fill(rect)
            self.draw(in: rect, blendMode: .destinationIn, alpha: 1.0)
        }
    }
}
