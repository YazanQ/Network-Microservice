//
//  AnyOptional.swift
//
//
//  Created by Yazan Qaisi on 10/12/2023.
//

import Foundation

public protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
    public var isNotNil: Bool { !isNil }
}

public extension Optional {
    func ifSome(then execute: (Wrapped) throws -> Void) rethrows {
        if case let .some(wrapped) = self {
            try execute(wrapped)
        }
    }

    func unwrap(throwing: @autoclosure () -> Error? = nil) throws -> Wrapped {
        switch self {
        case let .some(value): return value
        case .none: throw throwing() ?? UnwrapError()
        }
    }

    struct UnwrapError: Error, LocalizedError {
        public var errorDescription: String? { "Failed to unwrap \(Wrapped.self) value" }
    }
}

public extension Optional where Wrapped: Error {
    func throwIfSome() throws {
        switch self {
        case let .some(error): throw error
        case .none: break
        }
    }
}
