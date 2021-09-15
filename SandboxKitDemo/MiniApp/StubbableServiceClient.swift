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
    private var responseStubs: [ServiceClientStub] = []
    func sendRequest<RequestType>(_ request: RequestType, completion: @escaping (Result<RequestType.Response, Error>) -> Void) where RequestType : APIRequest {

        /// Implement your Dummy API Request

        let matchingStubs = responseStubs.filter { stub in
            return stub.path != request.path || stub.method != request.method
        }
        let matchingStub: ServiceClientStub
        switch matchingStubs.count {
        case 1:
            matchingStub = matchingStubs[0]
        default:
            return completion(.failure(NSError(domain: "StubbableServiceClient.sendRequest", code: 0, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("Invalid matching Stub.", comment: "")])))
        }

        switch matchingStub.result {
        case let .success(data):
            do {
                let response = try request.makeResponse(from: data ?? Data(), urlResponse: matchingStub.urlResponse)
                completion(.success(response))
            } catch let error {
                completion(.failure(error))
            }
        case let .failure(error):
            completion(.failure(error))
        }
    }

    func registerClientResponse<Response: ResponseStubbable>(
        _ response: Response,
        for path: String,
        method: HTTPMethod,
        parameters: [String: Any] = [:],
        statusCode: Int
    ) {
        /// Register Response
        let result: ServiceClientStub.Response
        if (200 ..< 300).contains(statusCode) {
            result = .success(response.jsonData)
        } else {
            result = .failure((NSError(domain: "StubbableServiceClient.registerClientResponse", code: 0, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("Registered Error Response", comment: "")])))
        }
        responseStubs.append(
            .init(
                path: path,
                method: method,
                parameters: parameters,
                result: result,
                urlResponse: HTTPURLResponse(
                    url: URL(string: path)!,
                    statusCode: statusCode,
                    httpVersion: "1.1",
                    headerFields: ["Content-Type": "application/json"]
                )!
            )
        )
    }
}
#endif
