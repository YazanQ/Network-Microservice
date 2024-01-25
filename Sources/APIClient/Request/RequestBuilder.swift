//
//  RequestBuilder.swift
//
//
//  Created by Yazan Qaisi on 10/12/2023.
//

import Foundation

public struct Request<Response: Decodable>: APIRequest {
    public let path: String
    public var method: HTTPMethod
    public var headers: HTTPHeaders?
    public var urlParameters: Encodable?
    public var body: Encodable?
}

public final class RequestBuilder<Response: Decodable> {
    private var path: String = ""
    private var method: HTTPMethod = .get
    private var headers: HTTPHeaders?
    private var urlParameters: Encodable?
    private var body: Encodable?
    private var version: String = "v1"

    public init() {}

    @discardableResult
    public func path(_ path: String) -> Self {
        self.path = path
        return self
    }

    @discardableResult
    public func method(_ method: HTTPMethod) -> Self {
        self.method = method
        return self
    }

    @discardableResult
    public func headers(_ headers: HTTPHeaders) -> Self {
        self.headers = headers
        return self
    }

    @discardableResult
    public func urlParameters(_ urlParameters: Encodable) -> Self {
        self.urlParameters = urlParameters
        return self
    }

    @discardableResult
    public func body(_ body: Encodable) -> Self {
        self.body = body
        return self
    }

    @discardableResult
    public func version(_ version: String) -> Self {
        self.version = version
        return self
    }

    public func build() -> Request<Response> {
        .init(
            path: path,
            method: method,
            headers: headers,
            urlParameters: urlParameters,
            body: body
        )
    }
}
