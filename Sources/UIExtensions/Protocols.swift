import Foundation

public protocol IDeinitDelegate: AnyObject {
    var onDeinit: (() -> ())? { get set }
}
