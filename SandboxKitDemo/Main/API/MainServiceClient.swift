//
//  MainServiceClient.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation

final class MainServiceClient: ServiceClient {
    func sendRequest<RequestType>(_ request: RequestType, completion: @escaping (Result<RequestType.Response, Error>) -> Void) where RequestType: APIRequest {
        // Implement URL Request
    }
}
