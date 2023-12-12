//
//  APIConfiguration.swift
//
//
//  Created by Yazan Qaisi Trend on 10/12/2023.
//

import Foundation

public struct APIConfiguration {
    let url: URL
    let requestTimeoutInterval: TimeInterval
    let requestRetryDelay: TimeInterval
    let requestRetryLimit: Int
    let urlSessionConfiguration: URLSessionConfiguration
    let headers: HTTPHeaders

    public init(
        urlString: String,
        requestTimeoutInterval: TimeInterval,
        requestRetryDelay: TimeInterval,
        requestRetryLimit: Int,
        urlSessionConfiguration: URLSessionConfiguration,
        headers: HTTPHeaders
    ) {
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL: \(urlString)")
        }
        self.url = url
        self.requestTimeoutInterval = requestTimeoutInterval
        self.requestRetryDelay = requestRetryDelay
        self.requestRetryLimit = requestRetryLimit
        self.urlSessionConfiguration = urlSessionConfiguration
        self.headers = headers
        self.urlSessionConfiguration.timeoutIntervalForRequest = requestTimeoutInterval
        self.urlSessionConfiguration.timeoutIntervalForResource = requestTimeoutInterval
    }
}
