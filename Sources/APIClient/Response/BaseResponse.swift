//
//  File.swift
//  
//
//  Created by Yazan Qaisi Trend on 10/12/2023.
//

import Foundation
import Helpers

public typealias PaginationResult<T> = (results: T, isNext: Bool, currentPage: Int)

public struct BaseResponse<T: Decodable>: Decodable {
    let data: T?
    let error: CoreError?
    let statusCode: Int?
    let message: String?
    let timestamp: String?
    let isNext: Bool?
    let currentPage: Int?
    let pageSize: Int?
    let totalItems: Int?
    let previous: Int?

    @discardableResult
    public func unwrap() throws -> T {
        try error.throwIfSome()

        return try data.unwrap(throwing: CoreError(message: message, code: statusCode))
    }

    public func unwrapPaginator() throws -> PaginationResult<T> {
        (try unwrap(), isNext ?? false, currentPage ?? 1)
    }
}
