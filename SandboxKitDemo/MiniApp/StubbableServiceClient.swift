//
//  StubbableServiceClient.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation
import SandboxKit

#if DEBUG
final class StubbableServiceClient: ServiceClient {
    func sendRequest<RequestType>(_ request: RequestType, completion: @escaping (Result<RequestType.Response, Error>) -> Void) where RequestType : APIRequest {
        /// Implement Dummy API Request
    }

    func registerClientResponse(
        _ response: Data?,
        for path: String,
        method: HTTPMethod,
        statusCode: Int
    ) {
        /// Register Response
    }
}
#endif
