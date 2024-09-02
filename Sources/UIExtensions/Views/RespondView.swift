//
//  RespondView.swift
//
//  Created by Sun on 2021/11/24.
//

import UIKit

// MARK: - RespondViewDelegate

public protocol RespondViewDelegate: AnyObject {
    var touchTransparent: Bool { get }
    func touchBegan()
    func touchEnd()
}

// MARK: - RespondView

public class RespondView: UIView {
    // MARK: Static Properties

    private static let touchableAreaInset: CGFloat = 50

    // MARK: Properties

    public weak var delegate: RespondViewDelegate?

    public var handleTouch: (() -> Void)?

    private var firstTouch: UITouch?
    private var isBegan = false

    // MARK: Computed Properties

    private var isValidTouch: Bool {
        guard let touch = firstTouch else {
            return false
        }

        let touchArea = bounds.insetBy(dx: -RespondView.touchableAreaInset, dy: -RespondView.touchableAreaInset)
        return touchArea.contains(touch.location(in: self))
    }

    // MARK: Overridden Functions

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.touchBegan()

        firstTouch = touches.first
        isBegan = true

        if delegate?.touchTransparent ?? true {
            super.touchesBegan(touches, with: event)
        }
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.touchEnd()
        if isValidTouch {
            handleTouch?()
        }

        isBegan = false
        firstTouch = nil

        if delegate?.touchTransparent ?? true {
            super.touchesEnded(touches, with: event)
        }
    }

    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.touchEnd()

        isBegan = false
        firstTouch = nil

        super.touchesCancelled(touches, with: event)
    }

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        let valid = isValidTouch
        if (isBegan && !valid) || (!isBegan && valid) {
            isBegan = isValidTouch
            if isBegan {
                delegate?.touchBegan()
            } else {
                delegate?.touchEnd()
            }
        }
    }
}
