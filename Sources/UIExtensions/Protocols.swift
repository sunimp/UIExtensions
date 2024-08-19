//
//  IDeinitDelegate.swift
//  CryptoWallet
//
//  Created by Sun on 2024/8/19.
//

import Foundation

public protocol IDeinitDelegate: AnyObject {
    var onDeinit: (() -> ())? { get set }
}
