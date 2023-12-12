//
//  Data.swift
//  KFHTask
//
//  Created by Yazan Qaisi on 11/08/2023.
//

import Foundation
import Helpers

public typealias JSONDictionary = [String: Any]

public extension Data {
    var json: JSONDictionary {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: .allowFragments),
              let jsonDictionary = jsonObject as? JSONDictionary
        else { return [:] }

        return jsonDictionary
    }
}


public extension Data {
    func decode<T: Decodable>(using decoder: JSONDecoder = .init()) throws -> T {
        do {
            return try decoder.decode(T.self, from: self)
        } catch let error as DecodingError {
            switch error {
            case let .typeMismatch(_, context):
                throw CoreError(message: "Decoding error - \(context.debugDescription)")
            case let .valueNotFound(type, context):
                throw CoreError(message: "Decoding error due to missing '\(type)' value for key '\(context.codingPath.map(\.stringValue).joined())'.")
            case let .keyNotFound(key, _):
                throw CoreError(message: "Decoding error due to key '\(key.stringValue)' not found.")
            case .dataCorrupted(let context):
                throw CoreError(message: "Decoding error - \(context.debugDescription)")

            @unknown default:
                throw error
            }
        } catch {
            throw error
        }
    }
}
