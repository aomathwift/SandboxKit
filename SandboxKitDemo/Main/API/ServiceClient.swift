//
//  ServiceClient.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation

protocol ServiceClient {
    func sendRequest<RequestType: APIRequest>(_ request: RequestType, completion: @escaping (Result<RequestType.Response, Error>) -> Void)
}
