//
//  APIClient.swift
//
//
//  Created by Yazan Qaisi Trend on 10/12/2023.
//

import Foundation

public protocol APIClient: AnyObject {
    var configuration: APIConfiguration { get }

    func execute<Request: APIRequest>(_ request: Request) async throws -> APIResponse<Request.Response>
}
