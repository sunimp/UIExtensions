//
//  Protocols.swift
//  UIExtensions
//
//  Created by Sun on 2023/3/27.
//

import Foundation

public protocol IDeinitDelegate: AnyObject {
    var onDeinit: (() -> Void)? { get set }
}
