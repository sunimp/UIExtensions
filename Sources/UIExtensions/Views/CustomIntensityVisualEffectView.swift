//
//  CustomIntensityVisualEffectView.swift
//  UIExtensions
//
//  Created by Sun on 2021/11/24.
//

import UIKit

open class CustomIntensityVisualEffectView: UIVisualEffectView {
    // MARK: Properties

    private var animator: UIViewPropertyAnimator!

    // MARK: Lifecycle

    /// Create visual effect view with given effect and its intensity
    ///
    /// - Parameters:
    ///   - effect: visual effect, eg UIBlurEffect(style: .dark)
    ///   - intensity: custom intensity from 0.0 (no effect) to 1.0 (full effect) using linear scale
    public init(effect: UIVisualEffect?, intensity: CGFloat) {
        super.init(effect: nil)
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [weak self] in self?.effect = effect }
        animator.fractionComplete = intensity
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
