//
//  Reusable.swift
//  KFHTask
//
//  Created by Yazan Qaisi on 11/08/2023.
//

import Foundation

public protocol Reusable {
    static var identifier: String { get }
}

public extension Reusable {
    static var identifier: String {
        String(describing: self)
    }
}

extension NSObject: Reusable {}
