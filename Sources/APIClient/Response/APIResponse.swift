//
//  APIResponse.swift
//
//
//  Created by Yazan Qaisi on 10/12/2023.
//

import Foundation

public struct APIResponse<T: Decodable> {
    public let value: T
    public let data: Data?
    public let urlRequest: URLRequest?
    public let urlResponse: URLResponse?
    public var statusCode: Int? { (urlResponse as? HTTPURLResponse)?.statusCode }


    public init(
        data: Data?,
        error: Error?,
        urlRequest: URLRequest?,
        urlResponse: URLResponse?
    ) throws {
        self.value = try data.unwrap(throwing: error).decode()
        self.data = data
        self.urlRequest = urlRequest
        self.urlResponse = urlResponse
    }
}
