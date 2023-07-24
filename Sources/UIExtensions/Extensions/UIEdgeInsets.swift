import UIKit

extension UIEdgeInsets {

    public var width: CGFloat {
        left + right
    }

    public var height: CGFloat {
        top + bottom
    }

    public func add(_ other: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(top: top + other.top, left: left + other.left, bottom: bottom + other.bottom, right: right + other.right)
    }

}
