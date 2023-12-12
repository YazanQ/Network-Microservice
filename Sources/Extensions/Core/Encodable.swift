//
//  Encodable.swift
//  KFHTask
//
//  Created by Yazan Qaisi on 11/08/2023.
//

import Foundation

public extension Encodable {
    func encode(using encoder: JSONEncoder = .init()) throws -> Data {
        try encoder.encode(self)
    }
}
