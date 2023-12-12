//
//  DefaultAPIClient.swift
//  
//
//  Created by Yazan Qaisi Trend on 10/12/2023.
//

import Foundation

public final class DefaultAPIClient {
    public let configuration: APIConfiguration

    public init(configuration: APIConfiguration) {
        self.configuration = configuration
    }
}

extension DefaultAPIClient: APIClient {
    public func execute<Request>(_ request: Request) async throws -> APIResponse<Request.Response> where Request : APIRequest {
        let urlRequest = request.urlRequest(for: configuration)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        return try APIResponse(
            data: data,
            error: nil,
            urlRequest: urlRequest,
            urlResponse: response
        )
    }
    

}
