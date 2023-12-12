//
//  CoreError.swift
//
//
//  Created by Yazan Qaisi Trend on 10/12/2023.
//

import Foundation

public struct CoreError: Error {
    public let message: String?
    public let code: Int?

    public init(message: String?, code: Int? = nil) {
        self.message = message
        self.code = code
    }
}

extension CoreError: LocalizedError {
    public var errorDescription: String? { message }
    public var failureReason: String? { message }
}

extension CoreError: Equatable, Hashable {}

extension CoreError: Codable {}

